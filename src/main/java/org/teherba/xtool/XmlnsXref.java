/*  Transforms (reads) XML files
    @(#) $Id: XmlnsXref.java 523 2010-07-26 17:57:50Z gfis $
    2010-06-13: ZipInputStream with ISO-8859-1 bug (solved by jazzlib), and link tag
    2007-08-13: read ZIP file(s)
    2007-03-29, Georg Fischer: copied from SwiftTransformer
*/
/*
 * Copyright 2006 Dr. Georg Fischer <punctum at punctum dot kom>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.teherba.xtool;
import  org.teherba.xtool.NonClosingInputStream;
import  java.io.FileInputStream;
import  java.io.InputStream;
import  java.io.PrintWriter;
import  java.nio.channels.Channels;
import  java.util.Iterator;
import  java.util.Stack;
import  java.util.TreeMap;
import  java.util.zip.ZipEntry;
import  java.util.zip.ZipInputStream;
import  org.xml.sax.Attributes;
import  org.xml.sax.InputSource;
import  org.xml.sax.XMLReader;
import  org.xml.sax.helpers.DefaultHandler;
import  org.xml.sax.helpers.XMLReaderFactory;
import  org.apache.log4j.Logger;

/** Reads a set of XML files, extracts the namespace URIs and prefixes
 *  and generates a crossreference listing as a HTML definition list.
 *  @author Dr. Georg Fischer
 */
public class XmlnsXref extends DefaultHandler { 
    public final static String CVSID = "@(#) $Id: XmlnsXref.java 523 2010-07-26 17:57:50Z gfis $";
    //                                  01234567890123456789012345678901234567890123
    //                                            1         2         3         4
    /** Current version and date */
    private static final String versionString = CVSID.substring(10, 43);

    /** log4j logger (category) */
    public Logger log;
    /** newline character(s) */
    private String nl;
    
    /** whether to replace sums and counters by a transformation stylesheet */
    private int withPrefixes;
    /** whether to write debugging comments */
    private int debug;
    /** whether the next file argument is a ZIP file */
    public int isZipped;

    /** map which is sorted by namespace URIs */
    private TreeMap/*<1.5*/<String, String>/*1.5>*/ rows;
    /** stack for XML tags */
    private Stack/*<1.5*/<String>/*1.5>*/ stack;
    /** writer for HTML output file */
    private PrintWriter out;
    /** name of the XML file currently parsed */
    private String xmlFileName;
    /** -e: which encoding to use for input AND output (ISO-8859-1, UTF-8) */
    private String encoding;
    /** Separator for partial key fields */
    private static final String SEPARATOR = "|";
            
    /** No-args constructor
     */
    public XmlnsXref() {
        log         = Logger.getLogger(XmlnsXref.class.getName());
        nl          = System.getProperty("line.separator");
        rows        = new TreeMap/*<1.5*/<String, String>/*1.5>*/();
        stack       = new Stack/*<1.5*/<String>/*1.5>*/();
        encoding    = "UTF-8"; // -e
        withPrefixes= 0; // default: do no show namespace prefixes
        isZipped    = 0;
        // out          = new StringWriter(131072);
    } // Constructor
    
    /** Display help: commandline options and arguments
     */
    private void usage() {
        System.err.println
                ( "Crossreference of namespace URIs, V" + versionString + nl
                + "Usage:" + nl 
                + "  java org.teherba.xtool.XmlnsXref [-e encoding] [-p] [-zip] [file ...]" + nl
                + "  -e   encoding UTF-8 (default), ISO-8859-1, US-ASCII etc." + nl
                + "  -p   with namespace prefixes" + nl
                + "  -zip following file is zipped" + nl
                );
    } // usage
    
    /** Sets the name of the XML file which was analyzed
     *  @param fileName name of the input file
     */
    public void setFileName(String fileName) {
        xmlFileName = fileName;
    } // setFileName
    
    /** Sets the writer for the HTML output (file) 
     *  @param writer writer for the output file
     */
    public void setWriter(PrintWriter writer) {
        out = writer;
    } // setWriter
    
    /** Pushes an XML tag, starts a new element with an attribute string
     *  @param tag tag for the element
     *  @param attrs string of attributes
     */
    private void xmlStart(String tag, String attrs) {
        try {
            if (stack.isEmpty()) {
                out.write("<?xml version=\"1.0\" encoding=\"" + encoding + "\"?>" + nl);
            }
            stack.push(tag);
            out.write("<" + tag + (attrs.length() == 0 ? "" : " " + attrs) + ">");
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // xmlStart

    /** Pushes an XML tag, starts a new element
     *  @param tag tag for the element
     */
    private void xmlStart(String tag) {
        xmlStart(tag, "");
    } // xmlStart

    /** Writes an empty XML element, possibly with attributes
     *  @param tag tag for the element
     *  @param attrs string of attributes
     */
    private void xmlEmpty(String tag, String attrs) {
        try {
            out.write("<" + tag + (attrs.length() == 0 ? "" : " " + attrs) + " />");
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // xmlStart

    /** Pops an XML tag, ends an element
     */
    private void xmlEnd() {
        try {
            String tag = (String) stack.pop();
            out.write("</" + tag + ">" + nl);
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // xmlEnd

    /** Writes character content to the XML file
     *  @param content characters to be written
     */
    private void xmlChars(String content) {
        try {
            out.write(content);
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // xmlStart

    /** Read the sorted tree map and generate an HTML definition list
     *  with one entry per URI.
     */
    public void serialize() {
        try {
            // put a dummy row at the end in order to break loop over treemap
            String zzzz = "~~~~"; // greater than any possible URI
            addEntry(zzzz, ""); // terminator for group change checking loop
            // log.debug(rows.size() + " rows");

            xmlStart("html", "xmlns=\"http://www.w3.org/1999/xhtml\"");
            xmlStart("head");
            xmlStart("title"); xmlChars("Namespace Crossreference"); xmlEnd(); // title
            xmlStart("link",  "rel=\"stylesheet\" type=\"text/css\" href=\"stylesheet.css\"");
            xmlEnd(); // link
            xmlStart("style");
            xmlChars("\n<!--\n");
            xmlChars("dt { font-family:Lucida Console,Courier,monospace; font-weight: bold; }\n");
            xmlChars("dd { font-family:Lucida Console,Courier,monospace ; }\n");
            xmlChars("-->\n");
            xmlEnd(); // style
            xmlEnd(); // head
            xmlStart("body");
            xmlStart("h2"); xmlChars("List of Namespace URIs"); xmlEnd();
            xmlStart("dl");
            String 
            oldURI = "";
            Iterator/*<1.5*/<String>/*1.5>*/ 
            iter = rows.keySet().iterator();
            boolean 
            busy = true;
            while (busy && iter.hasNext()) { // check for group changes
                String key = (String) iter.next();
                // log.debug("key: " + key);
                String fields[] = key.split("\\" + SEPARATOR, -3); // URI, fileName, prefix
                String uri      = fields[0];
                String fileName = fields[1];
                String prefix   = fields[2];
                if (! uri.equals(oldURI)) { // group change
                    oldURI = uri;
                    if (! uri.startsWith(zzzz)) { // terminate group change checking loop
                        xmlStart("a", "href=\"#" + uri.replaceAll("[\\:\\.\\$]", "_") + "\"");
                        xmlStart("dt"); 
                        xmlChars(uri);  
                        xmlEnd(); // dt
                        xmlEnd(); // a
                    } else { // dummy entry at the end - break the loop
                        busy = false;                   
                    }
                } else { // same URI as previous
                } // same URI
            } // while checking for group changes
            xmlEnd(); // dl

            xmlStart("h2"); xmlChars("Namespace URI and Prefix Crossreference"); xmlEnd();
            xmlStart("dl");
            oldURI = "";
            iter = rows.keySet().iterator();
            busy = true;
            while (busy && iter.hasNext()) { // check for group changes
                String key = (String) iter.next();
                // log.debug("key: " + key);
                String fields[] = key.split("\\" + SEPARATOR, -3); // URI, fileName, prefix
                String uri      = fields[0];
                String fileName = fields[1];
                String prefix   = fields[2];
                if (! uri.equals(oldURI)) { // group change
                    oldURI = uri;
                    if (! uri.startsWith(zzzz)) { // terminate group change checking loop
                        xmlStart("dt"); 
                        xmlEmpty("a", "name=\"" + uri.replaceAll("[\\:\\.\\$]", "_") + "\"");
                        xmlChars(uri);  
                        xmlEnd();
                    } else { // dummy entry at the end - break the loop
                        busy = false;                   
                    }
                } else { // same URI as previous
                } // same URI
                if (busy) {
                    xmlStart("dd"); 
                    if (withPrefixes > 0) {
                        xmlChars(prefix + ": ");
                    } // with withPrefixes
                    xmlChars(fileName); 
                    xmlEnd(); // dd
                } // if busy 
            } // while checking for group changes
            xmlEnd(); // dl
            xmlEnd(); // body
            xmlEnd(); // html
            out.close();
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // serialize
        
    /** Analyzes one XML input file, and remembers the filename, namespace URIs and
     *  corresponding prefixes.
     *  @param stream stream for the XML file to be analyzed
     */
    public void analyze(InputStream stream) {
        if (xmlFileName.matches(".*\\.x(ml|sl|sd)")) {          
            try {
                XMLReader parser = XMLReaderFactory.createXMLReader();
                parser.setContentHandler(this);
                parser.setErrorHandler  (this);
                parser.setFeature       ("http://xml.org/sax/features/validation"        , false);
                parser.setFeature       ("http://xml.org/sax/features/namespace-prefixes", true);
                parser.setFeature       ("http://xml.org/sax/features/namespaces"        , true);
                InputSource source = new InputSource(new NonClosingInputStream(stream));
                source.setEncoding(encoding);
                parser.parse(source);
            } catch (Exception exc) {
                log.error("Error in file: " + xmlFileName + "\n" + exc.getMessage(), exc);
            }
        } else {
            // ignore all other filetypes
        }
    } // analyze
    
    /** Process the commandline arguments and renames
     *  the namespace prefixes in the file accordingly.
     *  @param iargs index of 1st argument to be processed
     *  @param args the command line arguments, see {@link #main} method.
     *  @return index of first non-option argument (behind all options with leading dashes)
     */
    public int getOptions(int iargs, String[] args) {
        int result = 0;
        isZipped = 0;
        encoding = "UTF-8";
        try {
            int ienc  = 0;
            while (iargs < args.length && args[iargs].startsWith("-")) {
                String option = args[iargs ++].substring(1);
                if (false) {
                } else if (option.startsWith("e") && iargs < args.length) {
                    encoding = args[iargs ++];
                } else if (option.startsWith("p")) {
                    withPrefixes = 1;
                } else if (option.startsWith("z")) {
                    isZipped = 1;
                } else {
                    log.error("unknown option \"-" + option + "\"");
                }
            } // while commandline options
            result = iargs;
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        } // try
        return result;
    } // getOptions

    /** Processes the commandline arguments and 
     *  extracts the namespace URIs
     *  @param iargs index of 1st argument to be processed
     *  @param args commandline arguments as strings
     */
    public int process(int iargs, String args[]) {
        try {
            String fileName = args[iargs ++];
            setFileName(fileName);
            if (isZipped >= 1) { // ZIP archive with XML files
                ZipInputStream zis = new ZipInputStream(new FileInputStream(fileName));
                ZipEntry zentry = null;
                while ((zentry = zis.getNextEntry()) != null) {
                    setFileName(zentry.getName());
                    analyze(new NonClosingInputStream(zis));
                } // while entries
                zis.close();
            } else { // normal XML input file
                analyze(new FileInputStream(fileName));
            }
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        } // try
        return iargs;
    } // process
    
    /*=======================*/
    /* Main method           */
    /*=======================*/
    /** Main program, processes the commandline arguments
     *  @param args Arguments; if missing, print the following:
     *  <pre>
     *  usage:\tjava org.teherba.xtool.XmlnsXref ([-p] [-e] [-zip] file) ...
     *  </pre>
     */
    public static void main(String args[]) {
        XmlnsXref xref = new XmlnsXref();
        try {
            int iargs = 0;
            while (iargs < args.length) {
                iargs = xref.getOptions(iargs, args); // evaluate commandline options (-p old:new -p :new ...)
                iargs = xref.process   (iargs, args);
            } // while args
            // finally write a HTML table sorted by namespace URIs
            String outName = "xref.html";
        /*
            WritableByteChannel target = (new FileOutputStream (outName)).getChannel();
            xref.setWriter(new PrintWriter(Channels.newWriter(target, "UTF-8")));
        */
            xref.setWriter(new PrintWriter(Channels.newWriter(Channels.newChannel(System.out), "UTF-8")));
            xref.serialize();   
        } catch (Exception exc) {
            xref.log.error(exc.getMessage(), exc);
        }
    } // main

    /*=======================*/
    /* XML SAX Handler       */
    /*=======================*/

    /** Adds an entry to the crossreference table
     *  @param uri namespace URI or null (not in any namespace)
     *  @param prefix namespace prefix or null if missing (default)
     */
    private void addEntry(String uri, String prefix) {
        if (uri == null     || uri.length()     == 0) {
            uri = "(missing URI)";
        }
        if (prefix == null  || prefix.length()  == 0) {
            prefix = "(default)";
        }
        String key = uri + SEPARATOR + xmlFileName + SEPARATOR + (withPrefixes > 0 ? prefix : "");
        // log.debug(key + "\t" + xmlFileName);
        rows.put(key, xmlFileName);
    } // addEntry
    
    /** Evaluate all attributes of a start element event
     *  @param attrs list of attributes of a start element event
     */
    private void evalAttributes(Attributes attrs) {
        try {
            int nattr = attrs.getLength();
            int iattr = 0;
            while (iattr < nattr) {
                String qName = attrs.getQName(iattr);
                if (false) {
                } else if (qName.equals("xmlns")) { // default namespace
                    addEntry(attrs.getValue(iattr), "");
                } else if (qName.startsWith("xmlns:")) { // prefixed namespace
                    addEntry(attrs.getValue(iattr), qName.substring(6));
                } else {
                }
                iattr ++;
            } // while attrs
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // evalAttributes
    
    /** Receive notification of the beginning of the document.
     */
    public void startDocument() {
        try {
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // startDocument
    
    /** URI of W3C Schema */
    private static final String SCHEMA_URI = "http://www.w3.org/2001/XMLSchema";
    
    /** Receive notification of the start of an element.
     *  @param uri The Namespace URI, or the empty string if the element has no Namespace URI 
     *  or if Namespace processing is not being performed.
     *  @param localName the local name (without prefix), 
     *  or the empty string if Namespace processing is not being performed.
     *  @param qName the qualified name (with prefix), 
     *  or the empty string if qualified names are not available.
     *  @param attrs the attributes attached to the element. 
     *  If there are no attributes, it shall be an empty Attributes object.
     */
    public void startElement(String uri, String localName, String qName, Attributes attrs) {
        try {
            String prefix = "(default)";
            if (uri.length() == 0) {
                uri = "(missing URI)";
            }
            if (qName.length() == 0) {
                qName = "(unqualified)";
            }
            int colonPos = qName.indexOf(":");
            if (colonPos >= 0) {
                prefix = qName.substring(0, colonPos);
            }
            addEntry(uri, prefix);
            evalAttributes(attrs);
            if (uri.equals(SCHEMA_URI)) {
                if (false) {
                } else if (localName.equals("schema")) {
                    String target = attrs.getValue("targetNamespace");
                    if (target != null) {
                        addEntry(target, "(targetNamespace)");
                    }
                } else if (localName.equals("import")) {
                    String target = attrs.getValue("namespace");
                    if (target != null) {
                        addEntry(target, "(imported)");
                    }
                }
            } // W3C Schema
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // startElement
    
    /** Receive notification of the end of an element.
     *  @param uri the Namespace URI, or the empty string if the element has no Namespace URI 
     *  or if Namespace processing is not being performed.
     *  @param localName the local name (without prefix), 
     *  or the empty string if Namespace processing is not being performed.
     *  @param qName the qualified name (with prefix), 
     *  or the empty string if qualified names are not available.
     */
    public void endElement(String uri, String localName, String qName) {
        try {
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // endElement
    
    /** Receive notification of character data inside an element.
     *  @param ch the characters.
     *  @param start the start position in the character array.
     *  @param length the number of characters to use from the character array. 
     */
    public void characters(char[] ch, int start, int length) {
        try {
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // characters

} // XmlnsXref

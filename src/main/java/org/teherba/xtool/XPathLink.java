/*  Converts an XML file to XHTML and puts data links to XPathes
 *  on all elements and attributes.
    @(#) $Id: XPathLink.java 523 2010-07-26 17:57:50Z gfis $
    2007-09-27, Georg Fischer: copied from XmlnsXref
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
import  java.io.FileInputStream;
import  java.io.FileOutputStream;
import  java.io.InputStream;
import  java.io.OutputStream;
// for StAX - JSR 173
import  javax.xml.namespace.QName;
import  javax.xml.stream.XMLEventFactory;
import  javax.xml.stream.XMLEventReader;
import  javax.xml.stream.XMLEventWriter;
import  javax.xml.stream.XMLInputFactory;
import  javax.xml.stream.XMLOutputFactory;
import  javax.xml.stream.XMLStreamConstants;
import  javax.xml.stream.events.StartDocument;
import  javax.xml.stream.events.XMLEvent;
// other
import  org.apache.log4j.Logger;

/** Converts an XML file to XHTML and puts data links to XPathes
 *  on all elements and attributes.
 *  @author Dr. Georg Fischer
 */
public class XPathLink {
    public final static String CVSID = "@(#) $Id: XPathLink.java 523 2010-07-26 17:57:50Z gfis $";

    /** log4j logger (category) */
    public Logger log;

    /** encoding for input  (file) */
    private String sourceEncoding;
    /** encoding for output (file) */
    private String targetEncoding;
        
    /** Writer for XML output */
    private XMLEventWriter writer;
    /** current cursor in test case file */
    private XMLEventReader reader;
    /** streaming event factory */
    private XMLEventFactory factory;
    
    /** No-args Constructor */
    public XPathLink() {
        log             = Logger.getLogger(XPathLink.class.getName());
        factory         = XMLEventFactory.newInstance();
        reader          = null;
        writer          = null;
    } // Constructor XPathLink

    /** Returns some text with HTML emphasis 
     *  @param css CSS class designator for emphasis
     *  @param text text to be emphasized
     */
    private String emphasize(String css, String text) {
        return ("<span class=\"" + css + "\">" + text + "</span>");
    } // emphasisze
            
    /** Evaluates the commandline arguments and remembers them
     *  @param args the command line arguments, see {@link #main} method.
     *  @return index of first non-option argument (behind all options with leading dashes)
     */
    public int getOptions(String[] args) {
        int result = 0;
        sourceEncoding = "UTF-8";
        targetEncoding = sourceEncoding;
        try {
            // evaluate commandline options (-p old:new -p :new ...)
            int iargs = 0;
            int ienc  = 0;
            while (iargs < args.length && args[iargs].startsWith("-")) {
                String option = args[iargs ++].substring(1);
                if (false) {
                } else if (option.startsWith("e") && iargs < args.length) {
                    if (ienc == 0) {
                        sourceEncoding = args[iargs ++];
                        targetEncoding = sourceEncoding;
                        ienc ++;
                    } else {
                        targetEncoding = args[iargs ++];
                    }
                } else if (option.startsWith("p") && iargs < args.length) {
                    String pair = args[iargs ++];
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

    /** Opens the input and out file streams, and renames
     *  the namespace prefixes in the file according to the -p options.
     *  @param sourceStream stream for input  (file)
     *  @param targetStream stream for output (file)
     */
    public void process(InputStream sourceStream, OutputStream targetStream) {
        XMLEvent event    = null;
        QName qName       = null;
        Object obj        = null;
        String uri        = null;
        String localPart  = null;
        String prefix     = null;
        try {
            // get reader and writer from factories
            XMLInputFactory  sourceFactory = XMLInputFactory .newInstance();
            XMLOutputFactory targetFactory = XMLOutputFactory.newInstance();
            sourceFactory.setProperty("javax.xml.stream.isNamespaceAware", Boolean.TRUE);
            reader = sourceFactory.createXMLEventReader(sourceStream, sourceEncoding);
            writer = targetFactory.createXMLEventWriter(targetStream, targetEncoding);

            // loop over the input file
            while (reader.hasNext()) {
                event = (XMLEvent) reader.next();
                switch (event.getEventType()) { // depending on event type
                    
                    case XMLStreamConstants.START_DOCUMENT:
                        writer.add(factory.createStartDocument
                                ( targetEncoding != null 
                                		? targetEncoding 
                                		: ((StartDocument) event).getCharacterEncodingScheme()
                                , ((StartDocument) event).getVersion()
                                , ((StartDocument) event).isStandalone()
                                ));
                        writer.add(factory.createIgnorableSpace("\n"));
                        break; // START_DOCUMENT

                    case XMLStreamConstants.START_ELEMENT:
                        qName = event.asStartElement().getName();
                        localPart = qName.getLocalPart();
                        // log.debug("qName: " + qName.getPrefix() + ":" + qName.getLocalPart());
						obj = null;
                        if (obj != null) { // has an URI which is mapped
						/*
                            event = factory.createStartElement((String) obj, uri, localPart
                                    , event.asStartElement().getAttributes()
                                    , namespaces.iterator()
                                    );
                        */  
                        } 
                        writer.add(event);
                        break; // START_ELEMENT

                    case XMLStreamConstants.END_ELEMENT:
                        qName = event.asEndElement().getName();
                        localPart = qName.getLocalPart();
						obj = null;
                        if (obj != null) { // has an URI which is mapped
                            event = factory.createEndElement((String) obj, uri, localPart);
                        } 
                        writer.add(event);
                        break; // END_ELEMENT

                    default:
                        // copy all other portions of XML: START/END_DOCUMENT, COMMENT ...
                        writer.add(event);
                        break;
                } // switch event type
            } // while busy
            writer.flush();
        } catch (Exception exc) {
            try {
                writer.flush();
            } catch (Exception exc2) {
                log.error(exc2.getMessage(), exc);
            }
            log.error(exc.getMessage(), exc);
        } // try
    } // process

    /*=======================*/
    /* Main method           */
    /*=======================*/
    
    /** Main program, processes commandline arguments.
     *  @param args the command line arguments; typical activation:
     *  <pre>
     *  java -cp dist/xtool.jar org.teherba.xtool.XPathLink -p old1:new1 -p old2:new2 ... [infile [outfile]]
     *  </pre>
     *  Either the old or the new prefix may be empty (default namespace).
     *  Output is written to STDOUT if the output file is missing,
     *  and input is read from STDIN if the input file is missing, too.
     */
    public static void main(String[] args) {
        XPathLink linker = new XPathLink();
        try {
            int iargs = linker.getOptions(args); // evaluate commandline options (-p old:new -p :new ...)
            linker.process
                    ( iargs + 0 >= args.length  ? (InputStream ) System.in  : new FileInputStream (args[iargs + 0])
                    , iargs + 1 >= args.length  ? (OutputStream) System.out : new FileOutputStream(args[iargs + 1])
                    );
        } catch (Exception exc) {
            linker.log.error(exc.getMessage(), exc);
        } // try
    } // main 
    
} // XPathLink

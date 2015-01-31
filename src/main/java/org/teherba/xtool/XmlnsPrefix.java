/*  Renames element namespace prefixes in an XML files
    @(#) $Id: XmlnsPrefix.java 523 2010-07-26 17:57:50Z gfis $
    2008-02-19: Java 1.5 Generics; replace "xmlns:prefix" also
    2007-03-29, Georg Fischer: copied from SwiftTransformer
*/
/*
 * Copyright 2007 Dr. Georg Fischer <punctum at punctum dot kom>
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
import  java.util.ArrayList;
import  java.util.HashMap;
import  java.util.Iterator;
// for StAX - JSR 173
import  javax.xml.namespace.QName;
import  javax.xml.stream.XMLEventFactory;
import  javax.xml.stream.XMLEventReader;
import  javax.xml.stream.XMLEventWriter;
import  javax.xml.stream.XMLInputFactory;
import  javax.xml.stream.XMLOutputFactory;
import  javax.xml.stream.XMLStreamConstants;
import  javax.xml.stream.events.Attribute;
import  javax.xml.stream.events.Namespace;
import  javax.xml.stream.events.StartDocument;
import  javax.xml.stream.events.XMLEvent;
// other
import  org.apache.log4j.Logger;

/** Renames element namespace prefixes in an XML file.
 *  Attribute namespaces are not handled at all.
 *  The default (empty prefix) namespace can be switched 
 *  to an explicit prefix, and vice versa. 
 *	The prefix in the namespace declarations (xmlns:ppp="...") is
 *	replaced, too.
 *  @author Dr. Georg Fischer
 */
public class XmlnsPrefix {
    public final static String CVSID = "@(#) $Id: XmlnsPrefix.java 523 2010-07-26 17:57:50Z gfis $";

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
    
    /** maps URIs to new prefixes; the empty prefix stands for the default namespace */
    private HashMap/*<1.5*/<String, String>/*1.5>*/ uriMap;
    /** maps old to new prefixes: "old:new" maps "old" (key) to "new" (value) */
    private HashMap/*<1.5*/<String, String>/*1.5>*/ prefixMap;

    /** No-args Constructor 
     */
    public XmlnsPrefix() {
        log             = Logger.getLogger(XmlnsPrefix.class.getName());
        factory         = XMLEventFactory.newInstance();
        reader          = null;
        writer          = null;
        uriMap          = new HashMap/*<1.5*/<String, String>/*1.5>*/(16);
        prefixMap       = new HashMap/*<1.5*/<String, String>/*1.5>*/(16);
    } // Constructor 
        
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
                    int colonPos = pair.indexOf(":");
                    if (colonPos >= 0) { // "old:new" maps "old" (key) to "new" (value)
                        prefixMap.put(pair.substring(0, colonPos), pair.substring(colonPos + 1));
                    } // ":" found
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
                    
                    case XMLStreamConstants.START_ELEMENT:
                        qName = event.asStartElement().getName();
                        localPart = qName.getLocalPart();
                        // log.debug("qName: " + qName.getPrefix() + ":" + qName.getLocalPart());
                        Iterator/*<1.5#/<Namespace>/#1.5>*/ nspIter = event.asStartElement().getNamespaces();
                        ArrayList/*<1.5*/<Namespace>/*1.5>*/ namespaces = new ArrayList/*<1.5*/<Namespace>/*1.5>*/();
                        while (nspIter.hasNext()) {
                            Namespace nsp = (Namespace) nspIter.next(); // Namespace extends Attribute
                            prefix = nsp.getPrefix();
                            uri = nsp.getNamespaceURI(); 
	                        log.debug("nsp: " + prefix + ":" + uri);
                            obj = prefixMap.get(prefix);
                            if (obj != null) { // old prefix was found 
                                prefix = (String) obj; // mapped to newPrefix
                                uriMap.put(uri, prefix);
                            } // else remains the same
                            namespaces.add(factory.createNamespace(prefix, uri));
                        } // while nspIter
                        Iterator/*<1.5#/<Attribute>/#1.5>*/ attrIter = event.asStartElement().getAttributes();
                        ArrayList/*<1.5*/<Attribute>/*1.5>*/ attrs = new ArrayList/*<1.5*/<Attribute>/*1.5>*/();
                        while (attrIter.hasNext()) {
                            Attribute attr = (Attribute) attrIter.next();
                            QName qaName = attr.getName();
	                        log.debug("qaName: " + qaName.getPrefix() + ":" + qaName.getLocalPart());
                            attrs.add(factory.createAttribute(qaName, attr.getValue()));
                        } // while attrIter
						
                        uri = qName.getNamespaceURI();
                        obj = uriMap.get(uri);
                        if (obj != null) { // has an URI which is mapped
                            event = factory.createStartElement((String) obj, uri, localPart
                                    , attrs.iterator()
                                    , namespaces.iterator()
                               //   , event.asStartElement().getNamespaceContext()
                                    );
                        } 
                        writer.add(event);
                        break; // START_ELEMENT

                    case XMLStreamConstants.END_ELEMENT:
                        qName = event.asEndElement().getName();
                        localPart = qName.getLocalPart();
                        uri = qName.getNamespaceURI();
                        obj = uriMap.get(uri);
                        if (obj != null) { // has an URI which is mapped
                            event = factory.createEndElement((String) obj, uri, localPart);
                        } 
                        writer.add(event);
                        break; // END_ELEMENT

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

                    default:
                        // copy all other portions of XML: START/END_DOCUMENT ...
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

    /** Main program, processes commandline arguments.
     *  @param args the command line arguments; typical activation:
     *  <pre>
     *  java -cp dist/xtool.jar org.teherba.xtool.XmlnsPrefix -p old1:new1 -p old2:new2 ... [infile [outfile]]
     *  </pre>
     *  Either the old or the new prefix may be empty (default namespace).
     *  Output is written to STDOUT if the output file is missing,
     *  and input is read from STDIN if the input file is missing, too.
     */
    public static void main(String[] args) {
        XmlnsPrefix prefixer = new XmlnsPrefix();
        try {
            int iargs = prefixer.getOptions(args); // evaluate commandline options (-p old:new -p :new ...)
            prefixer.process
                    ( iargs + 0 >= args.length  ? (InputStream ) System.in  : new FileInputStream (args[iargs + 0])
                    , iargs + 1 >= args.length  ? (OutputStream) System.out : new FileOutputStream(args[iargs + 1])
                    );
        } catch (Exception exc) {
            prefixer.log.error(exc.getMessage(), exc);
        } // try
    } // main 
    
} // XmlnsPrefix

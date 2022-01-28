/*  Renames element namespace prefixes in an XML files
    @(#) $Id: XPathSelect.java 523 2010-07-26 17:57:50Z gfis $
    2007-09-24, Georg Fischer: copied from Apache Xalan Samples
*/
/*
 * Copyright 2001-2004 The Apache Software Foundation.
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
import  java.io.InputStream;
import  java.io.OutputStream;
import  java.util.Properties;
import  javax.xml.parsers.DocumentBuilderFactory;
import	javax.xml.xpath.XPath;
import	javax.xml.xpath.XPathConstants;
import	javax.xml.xpath.XPathExpression;
import	javax.xml.xpath.XPathFactory;
import	org.xml.sax.InputSource;
import	org.w3c.dom.Document;
import	org.w3c.dom.Element;
import	org.w3c.dom.NodeList;
import  org.apache.xml.serializer.DOMSerializer;
import  org.apache.xml.serializer.Serializer;
import  org.apache.xml.serializer.SerializerFactory;
import  org.apache.xml.serializer.OutputPropertiesFactory;
import  org.apache.logging.log4j.Logger;
import  org.apache.logging.log4j.LogManager;

/** Applies an XPath expression to STDIN or one or more files.
 *	JAXP 1.3 XPath API sample.
 * 
 *	Basic utility for applying an XPath expression to an input XML file and printing
 *	the evaluation result, using JAXP 1.3 XPath API.
 * 
 *	Takes 2 arguments:
 *	(1) an xml file name
 *	(2) an XPath expression to apply to the input document
 *	Example:
 *	<pre>
 *		java XPathSelect foo.xml /doc/name[1]/@last str
 *	</pre>
 */

public class XPathSelect {
    public final static String CVSID = "@(#) $Id: XPathSelect.java 523 2010-07-26 17:57:50Z gfis $";

    /** log4j logger (category) */
    public Logger log;

    /** encoding for output (file) */
    private String resultEncoding;
	/** XPath from factory */
	private XPath xpath;	
	/** the XPath expression to be applied to the input file */
	private String expression;	

    /** Empty Constructor - creates a new instance of XPathSelect */
    public XPathSelect() {
        log = LogManager.getLogger(XPathSelect.class.getName());
        // Create a new XPath
        xpath = XPathFactory.newInstance().newXPath();
        expression = "."; // default: current (root) context
    } // Constructor XPathSelect
        
    /** Opens the input and out file streams, and renames
     *  the namespace prefixes in the file according to the -p options.
     *  @param sourceStream stream for input  (file)
     *	@param out stream for output
     */
    public void apply1(InputStream sourceStream, OutputStream out) {
        try {
        	// compile the XPath expression
	        DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
			docBuilderFactory.setNamespaceAware(false); // since SAG parameter files do not bind prefix "Ft:"
			docBuilderFactory.setIgnoringComments(false);
			docBuilderFactory.setIgnoringElementContentWhitespace(true);
	  		docBuilderFactory.setValidating(true);
	        Document doc = docBuilderFactory.newDocumentBuilder().newDocument();          	
			Element root = doc.createElement("result");
			root.appendChild(doc.createTextNode("\n"));

        	XPathExpression xpathExpr = xpath.compile(expression);
        	// Evaluate the XPath expression against the input document
	        InputSource source = new InputSource(sourceStream);
	        Object obj = xpathExpr.evaluate(source, XPathConstants.NODESET);
        	if (obj instanceof NodeList) {
        	    NodeList nodes = (NodeList) obj;
	            int ichild = 0;
	            while (ichild < nodes.getLength()) {
					root.appendChild(doc.adoptNode(nodes.item(ichild ++).cloneNode(true)));
					root.appendChild(doc.createTextNode("\n"));
	            } // while ichild
        	} // 

			Properties props = OutputPropertiesFactory.getDefaultMethodProperties("xml");
            // props.storeToXML(out, "xalan properties");
            props.setProperty("encoding", resultEncoding);
            props.setProperty("indent", "yes");
            props.setProperty(OutputPropertiesFactory.S_KEY_INDENT_AMOUNT, "2");            
            props.setProperty("{http\u003a//xml.apache.org/xalan}indent-amount", "2");
        /*
            props.setProperty("{http\u003a//xml.apache.org/xalan}entities", "org/apache/xml/serializer/XmlEntities");
        */
            props.setProperty("standalone", "yes");
            // props.storeToXML(out, "xalan properties");
            Serializer serializer = SerializerFactory.getSerializer(props);
			serializer.setOutputStream(out);
            DOMSerializer ser = serializer.asDOMSerializer();
			ser.serialize(root); 
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        } // try
    } // apply1

    /** Process the commandline arguments and renames
     *  the namespace prefixes in the file accordingly.
     *  @param args the command line arguments, see {@link #main} method.
     *  @return index of first non-option argument (behind all options with leading dashes)
     */
    public int getOptions(String[] args) {
        int result = 0;
        resultEncoding = "UTF-8";
        try {
            // evaluate commandline options 
            int iargs = 0;
            int ienc  = 0;
            while (iargs < args.length && args[iargs].startsWith("-")) {
                String option = args[iargs ++].substring(1);
                if (false) {
                } else if (option.startsWith("e") && iargs < args.length) {
                    resultEncoding = args[iargs ++];
                } else {
                    log.error("unknown option \"-" + option + "\"");
                }
            } // while commandline options
            if (iargs < args.length) { // expression doesn't start with "-"
            	expression = args[iargs ++];
            }          	
            result = iargs;
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        } // try
        return result;
    } // getOptions

    /** Main program, processes commandline arguments.
     *  @param args the command line arguments; typical activation:
     *  <pre>
     *  java -cp dist/xtool.jar org.teherba.xtool.XPathSelect expr [infile ...]
     *  </pre>
     *  Th input is read from STDIN if the input file is missing.
     */
    public static void main(String[] args) {
        XPathSelect applicator = new XPathSelect();
        try {
            int iargs = applicator.getOptions(args); // evaluate commandline options 
	        if (args.length - iargs == 0) { // no more arguments - print usage
	        	System.err.println("Usage: java org.teherba.xtool.XPathSelect [-e resultencoding] expr [infile ...]");
        	} else {
	            OutputStream out = System.out;
        		if (iargs >= args.length) { // no input file - apply to STDIN only
    	        		applicator.apply1((InputStream) System.in, out);
        		} else { // one or more input files
	        		while (iargs < args.length) {
    	        		applicator.apply1(new FileInputStream (args[iargs ++]), out);
    	        	}
    	        } // 1 or more
	            out.close();
            } // iargs >= 1
        } catch (Exception exc) {
            applicator.log.error(exc.getMessage(), exc);
        } // try
    } // main 
    
} // XPathSelect

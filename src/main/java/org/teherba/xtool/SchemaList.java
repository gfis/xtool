/*  Reads a W3C XML schema (.xsd) file and shows an indented, linear
    representation of the elements in a canonical (fully expanded) instance.
    @(#) $Id: SchemaList.java 523 2010-07-26 17:57:50Z gfis $
    2008-07-25: new names
    2007-11-23: copied from SchemaTree, totally restructured
    2007-07-23, Georg Fischer
    
    Caution, this file must be stored in UTF-8: äöüÄÖÜß
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
import  org.teherba.xtool.SchemaBean;
import  org.teherba.xtool.SchemaArray;
import  java.io.FileInputStream;
import  java.io.FileOutputStream;
import  java.io.InputStream;
import  java.io.OutputStream;
import  java.io.PrintStream;
import  org.apache.log4j.Logger;

/** Shows a W3C XML schema as a tree of elements; 
 *  reads a schema (.xsd) file and prints the element nodes 
 *  with their types, multiplicity, enumerations, patterns, annotations and other attributes
 *  in a linear, indented representation (a {@link SchemaArray} with {@link SchemaBean}s).
 *
 *  @author Dr. Georg Fischer
 */
public class SchemaList { 
    public final static String CVSID = "@(#) $Id: SchemaList.java 523 2010-07-26 17:57:50Z gfis $";
    //                                  01234567890123456789012345678901234567890123
    //                                            1         2         3         4
    /** Current version and date */
    private static final String versionString = CVSID.substring(10, 43);

    /** log4j logger (category) */
    public Logger log;
    /** whether to write debugging comments */
    private int debug;
    /** newline character(s) */
    private String nl;

	// bean properties
    /** whether to generate comments for annotations and documentation */
    private int withAnnotations;
    /** whether to show the first choice only (1) 
	 *	or all possible choices (0) with a pseudo element "unresolvedChoice" 
	 */
    private int firstChoice;
    /** output format code: HTML, XML, tsv, plain text */
    private int mode;
    /** Defines whether only start tags should be shown */
	private int startTagsOnly;
    /** whether to generate comments for types, restrictions, patterns etc. */
    private int withComments;
    /** whether to show types (default 0 = no) */
    private int withTypes;
    /** whether to generate element values (default 0 = no) */
    private int withValues;
    /** name of the XML file currently parsed */
    private String xmlFileName;
    /** number of specified encoding options */
    private int encNo;
    /** source file encoding */
    private String sourceEncoding;
    /** result file encoding */
    private String resultEncoding;

    /** Linear list of elements from the schema */
    private SchemaArray schemaArray;
            
    /** No-args constructor
     */
    public SchemaList() {
        log = Logger.getLogger(SchemaList.class.getName());
        nl = System.getProperty("line.separator");
        mode            = SchemaBean.MODE_PLAIN;
        debug           = 0;
        firstChoice     = 0;
        startTagsOnly   = 0;
        withComments    = 0;
        withValues      = 0;
		sourceEncoding  = "UTF-8";
		resultEncoding  = sourceEncoding;
		encNo = 0; // no encoding option specified so far
    } // constructor

    /** Display help: print English help text for commandline options and arguments
     */
    private void usage() {
    	System.err.println("usage:\tjava -cp dist/xtool.jar org.teherba.xtool.SchemaList"
    				 + " [-c] [-d] [-e enc [-e enc]] [-f] [-m mode] [-v] \\" 
     			+ nl + "\t\t\tschemaFile [outputfile]"
     			+ nl + "-c 		with comments"
     			+ nl + "-d		debugging trace"
     			+ nl + "-e enc	source or result file encoding: UTF-8, ISO-8859-1 etc."
     			+ nl + "-f		take first alternative of choice constructions"
     			+ nl + "-m mode output mode: html, plain, tsv or xml"
     			+ nl + "-v		generate and show values"
				+ nl);
    } // usage
    
    /** Sets the name of the XML file which was analyzed
     *  @param fileName name of the input file
     */
    public void setFileName(String fileName) {
        xmlFileName = fileName;
    } // setFileName
    
    /** Gets the name of the XML file which was analyzed
     *  @return fileName name of the input file
     */
    public String getFileName() {
        return xmlFileName;
    } // getFileName
    
    /** External formatting codes (keep them in synch with MODE_* enumeration in {@link SchemaBean}) */
    private String[] formats = new String[] {"html", "plain", "tsv", "xml"};
    
    /** Sets the output mode
     *  @param format external denotation for HTML, plain text, tab separated or XML output format
     */
    public void setMode(String format) {
        mode = format.indexOf(format);
        if (mode < 0) { // not found
        	mode = SchemaBean.MODE_PLAIN;
        } // not found
    } // setMode
    
    /** Gets the output mode
     *  @return mode code for HTML, plain text, tab separated or XML
     */
    public String getMode() {
        return formats[mode];
    } // getMode
    
    /** whether first xs:element is not yet processed */ 
    private boolean globalBusy;
    
    /** Evaluates the commandline arguments and remembers them
     *  @param args commandline arguments: options with leading dashes 
     *  and optional trailing filenames without a dash
     *  @return the index of the first argument whithout leading '-'
     */
    public int getOptions(String args[]) {
        int iargs = 0;
        try {
            while (iargs < args.length && args[iargs].startsWith("-")) {
                String option = args[iargs ++].substring(1);
                if (option.indexOf("c") >= 0) {
                    withComments = 1;
                } // -c
                if (option.indexOf("d") >= 0) {
                    debug = 2;
                } // -d
                if (option.indexOf("e") >= 0 && iargs < args.length) {
                	encNo ++;
                	if (encNo == 1) {
                    	sourceEncoding = args[iargs ++];
                    	resultEncoding = sourceEncoding;
                    } else {
                    	resultEncoding = args[iargs ++];
					}                    	
                } // -e
                if (option.indexOf("f") >= 0) {
                    firstChoice = 1;
                } // -f
                if (option.indexOf("m") >= 0) {
                    String format = args[iargs ++];
                    if (false) {
                    } else if (format.startsWith("html" )) {
                        mode = SchemaBean.MODE_HTML;
                    } else if (format.startsWith("plain")) {
                        mode = SchemaBean.MODE_PLAIN;
                    } else if (format.startsWith("tsv"  )) {
                        mode = SchemaBean.MODE_TSV;
                    } else if (format.startsWith("xml"  )) {
                        mode = SchemaBean.MODE_XML;
                    } else {
                        log.error("unknown format " + format);
                    }                       
                } // -m
                if (option.indexOf("s") >= 0) {
                    startTagsOnly = 1;
                } // -s
                if (option.indexOf("v") >= 0) {
                    withValues = 1;
                } // -v
            } // while commandline options
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        } // try
        return iargs;
    } // getOptions
        
    /** Walks through the defined possible element structure and
     *  displays an indented list of element tags (a "SchemaArray" with one "SchemaBean" per line),
     *  together with the features specified for the element.
     *  @param inStream input stream for schema file
     *  @param outStream output stream for resulting tree (file or http response)
     */
    public void listSchema(InputStream inStream, OutputStream outStream) {
        try {
            schemaArray = new SchemaArray();
            schemaArray.setDebug           (debug);
            schemaArray.setChoiceResolution(firstChoice);
            schemaArray.setMode            (mode);
            schemaArray.setStartTagsOnly   (startTagsOnly);
            schemaArray.setWithComments    (withComments);
            schemaArray.setWithValues      (withValues);
            PrintStream printer = new PrintStream(outStream, true, resultEncoding);
            schemaArray.setPrintStream	   (printer, resultEncoding); // options must have been set before
            
            schemaArray.loadSchema(inStream, sourceEncoding);
            schemaArray.simplify();
            schemaArray.print(getFileName(), resultEncoding);
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        } // try
    } // listSchema
        
    /*=======================*/
    /* Main method           */
    /*=======================*/
    /** Main program, processes the commandline arguments
     *  @param args Arguments; if missing, print the following:
     *  <pre>
     *  usage:\tjava -cp dist/xtool.jar org.teherba.xtool.SchemaList [-c] [-d] [-e enc] [-f] [-m mode] [-v] \\
     		schemaFile [outputfile]
     	-c 		with comments
     	-d		debugging trace
     	-e enc	source encoding: UTF-8, ISO-8859-1 etc.
     	-f		take first alternative of choice constructions
     	-m mode output mode: html, plain, tsv or xml
     	-v		generate and show values
     *  </pre>
     */
    public static void main(String args[]) {
        SchemaList list = new SchemaList();
        try {
            int ifile = list.getOptions(args);
            if (ifile < args.length) { // sufficient arguments, at least 1 filename
	            String fileName = args[ifile ++];
	            list.setFileName(fileName);
	            OutputStream out = System.out;
	            if (ifile < args.length) {
	                out = new FileOutputStream(args[ifile ++]);
	            }
	            list.listSchema(new FileInputStream(fileName), out);
        	} else { // not any filename
        		list.usage();
        	}
        } catch (Exception exc) {
            list.log.error(exc.getMessage(), exc);
        } // try
    } // main

} // SchemaList

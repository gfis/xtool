/*  IndexPage.java - main web page for Xtool
 *  @(#) $Id: 57d01d0860aef0c2f2783647be70c3c381710c86 $
 *  2016-08-28: Dr. Georg Fischer: copied from Dbat
 */
/*
 * Copyright 2016 Dr. Georg Fischer <punctum at punctum dot kom>
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
package org.teherba.xtool.web;
import  org.teherba.common.web.BasePage;
import  java.io.PrintWriter;
import  java.io.Serializable;
import  java.util.Iterator;
import  javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import  javax.servlet.http.HttpSession;
import  org.apache.log4j.Logger;

/** RaMath main dialog page
 *  @author Dr. Georg Fischer
 */
public class IndexPage implements Serializable {
    public final static String CVSID = "@(#) $Id: 57d01d0860aef0c2f2783647be70c3c381710c86 $";
    public final static long serialVersionUID = 19470629;

    /** log4j logger (category) */
    private Logger log;

    /** No-args Constructor
     */
    public IndexPage() {
        log      = Logger.getLogger(IndexPage.class.getName());
    } // Constructor

    /** Output the main dialog page for RaMath
     *  @param request request with header fields
     *  @param response response with writer
     *  @param basePage refrence to common methods and error messages
     *  @param language 2-letter code en, de etc.
     *  @param parms parameters for the message
     */
    public void dialog(HttpServletRequest request, HttpServletResponse response
            , BasePage basePage
            , String language
            , String[] parms
            ) {
        try {
            PrintWriter out = basePage.writeHeader(request, response, language);
            HttpSession session = request.getSession();

            out.write("<title>" + basePage.getAppName() + " Main Page</title>\n");
            out.write("</head>\n<body>\n");

            Object
            field = session.getAttribute("tool"     );  String tool         = (field != null) ? (String) field : "SchemaList";
            field = session.getAttribute("nsp"      );  String namespace    = (field != null) ? (String) field : "";
            field = session.getAttribute("opt"      );  String options      = (field != null) ? (String) field : "";
            field = session.getAttribute("file1"    );  String file1        = (field != null) ? (String) field : "";
            field = session.getAttribute("file2"    );  String file2        = (field != null) ? (String) field : "";
            int index = 0;
            
            out.write("<!-- tool=\"" + tool + "\", namespace=\"" + namespace + "\", options=\"" + options + " -->\n");
            out.write("<h2><a href=\"http://www.teherba.org\">teherba.org</a> XML and Schema Tools</h2>\n");
            out.write("<form action=\"servlet\" method=\"post\" enctype=\"multipart/form-data\">\n");
            out.write("    <input type = \"hidden\" name=\"view\" value=\"index\" />\n");
            out.write("    <table cellpadding=\"8\">\n");
            out.write("        <tr valign=\"top\">\n");
            out.write("            <td rowspan=\"2\"><strong>Tool</strong><br />\n");
            out.write("                <select name=\"tool\" size=\"4\">\n");
            out.write("                    <option value=\"SchemaList\" selected>SchemaList</option>\n");
            out.write("                    <option value=\"XmlnsPrefix\"        >XmlnsPrefix</option>\n");
            out.write("                    <option value=\"XmlnsXref\"          >XmlnsXref</option>\n");
            out.write("                    <option value=\"XPathSelect\"        >XPathSelect</option>\n");
            out.write("                </select>\n");
            out.write("            </td>\n");
            out.write("            <td>\n");
            out.write("                Options<br />\n");
            out.write("                <input name=\"opt\"               style=\"font-family: Courier, monospace\"\n");
            out.write("                        maxsize=\"512\" size=\"64\" value=\"" + options + "\" />\n");
            out.write("                <br />\n");
            out.write("                Input File<br />\n");
            out.write("                <input name=\"file1\" type=\"file\" style=\"font-family: Courier, monospace\"\n");
            out.write("                        maxsize=\"512\" size=\"64\" value=\"" + file1 + "\"/>\n");
            out.write("                &nbsp;\n");
            out.write("                &nbsp;\n");
            out.write("                <input type=\"submit\" value=\"Submit\" />\n");
            out.write("            </td>\n");
            out.write("        </tr>\n");
            out.write("    </table>\n");
            out.write("</form>\n");
            out.write("<p />\n");
            out.write("<dl>\n");
            out.write("<dt>SchemaList - List the Element Tree of a W3C XML Schema</dt>\n");
            out.write("<dd>\n");
            out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
            out.write("<tr><td>Options:</td></tr>\n");
            out.write("    <tr><td><tt>-c</tt></td><td>&nbsp;</td><td> show comments with types, restrictions, patterns etc.</td></tr>\n");
            out.write("    <tr><td><tt>-e enc</tt></td><td>&nbsp;</td><td> source file encoding, default: UTF-8</td></tr>\n");
            out.write("    <tr><td><tt>-e enc</tt></td><td>&nbsp;</td><td> target file encoding, default: UTF-8</td></tr>\n");
            out.write("    <tr><td><tt>-f</tt></td><td>&nbsp;</td><td> show first alternative of choices only</td></tr>\n");
            out.write("    <tr><td><tt>-m mode</tt></td><td>&nbsp;</td><td> output mode: \"html\" (default), \"plain\", \"tsv\" (for MS-Excel) or \"xml\"\n");
            out.write("    <tr><td><tt>-s</tt></td><td>&nbsp;</td><td> show start tags only (no end tags)</td></tr>\n");
            out.write("    <tr><td><tt>-v</tt></td><td>&nbsp;</td><td> generate element values</td></tr>\n");
            out.write("</table>\n");
            out.write("<br />\n");
            out.write("</dd>\n");
            out.write("<dt>XmlnsPrefix - Modify XML Namespace Prefixes</dt>\n");
            out.write("<dd>\n");
            out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
            out.write("<tr><td>Options:</td></tr>\n");
            out.write("    <tr><td><tt>-e enc</tt></td><td>&nbsp;</td><td> source file encoding, default: UTF-8</td></tr>\n");
            out.write("    <tr><td><tt>-p old1:new1</tt></td><td>&nbsp;</td><td> change prefix \"old1\" to prefix \"new1\" (both may be empty)</td></tr>\n");
            out.write("    <tr><td><tt>-p old2:new2</tt></td><td>&nbsp;</td><td> ...</td></tr>\n");
            out.write("</table>\n");
            out.write("<br />\n");
            out.write("</dd>\n");
            out.write("<dt>XmlnsXref - XML Namespace URI and Prefix Crossreference</dt>\n");
            out.write("<dd>\n");
            out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
            out.write("<tr><td>Options:</td></tr>\n");
            out.write("    <tr><td><tt>-e enc</tt></td><td>&nbsp;</td><td> source file encoding, default: UTF-8</td></tr>\n");
            out.write("    <tr><td><tt>-p</tt></td><td>&nbsp;</td><td> show namespace prefixes</td></tr>\n");
            out.write("    <tr><td><tt>-zip</tt></td><td>&nbsp;</td><td> input file is zip archive</td></tr>\n");
            out.write("</table>\n");
            out.write("<br />\n");
            out.write("</dd>\n");
            out.write("<dt>XPathSelect - Apply an XPath expression to an XML file</dt>\n");
            out.write("<dd>\n");
            out.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n");
            out.write("<tr><td>Options:</td></tr>\n");
            out.write("    <tr><td><tt>-e enc</tt></td><td>&nbsp;</td><td> result file encoding, default: UTF-8</td></tr>\n");
            out.write("    <tr><td><tt>expr</tt></td><td>&nbsp;</td><td> XPath expression (without functions and variables)</td></tr>\n");
            out.write("</table>\n");
            out.write("<br />\n");
            out.write("</dd>\n");
            out.write("</dl>\n");

            basePage.writeAuxiliaryLinks(language, "main");
            basePage.writeTrailer(language, "quest");
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // dialog

    //================
    // Main method
    //================

    /** Test driver
     *  @param args language code: "en", "de"
     */
    public static void main(String[] args) {
        IndexPage help = new IndexPage();
        System.out.println("no messages");
    } // main

} // IndexPage

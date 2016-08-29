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

            int width  = 80;
            int height = 4;
            String[] optArea    = new String []
                    { "rset"    // 0
                    , "cfra"    // 1
                    , "eecj"    // 2
                    } ;
            String[] enArea     = new String []
                    { "Symbolic Polynomial"         // 0
                    , "Continued Fraction"          // 1
                    , "Euler's Extended Conjecture" // 2
                    } ;
            Object
            field = session.getAttribute("view"     );  String view  = (field != null) ? (String) field : "upper";
            field = session.getAttribute("area"     );  String area  = (field != null) ? (String) field : "rset";
            field = session.getAttribute("opt"      );  String opt   = (field != null) ? (String) field : "norm";
            field = session.getAttribute("form1"    );  String form1 = (field != null) ? (String) field : "(a-b)^4";
            field = session.getAttribute("form2"    );  String form2 = (field != null) ? (String) field : "";
            field = session.getAttribute("form2c"    ); String form2c= (field != null) ? (String) field : "";
            field = session.getAttribute("varmap"   );

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

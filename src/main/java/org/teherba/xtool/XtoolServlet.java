/*  Servlet for several XML utilities: W3C schema as an indented list, XML namespaces and their prefixes
    @(#) $Id: XtoolServlet.java 523 2010-07-26 17:57:50Z gfis $
    2016-09-01: remove JSPs and session
    2015-08-06: import java.util.zip.* from jazzlib.sourceforge.net
    2008-02-13: SchemaTree removed
    2007-11-20: with SchemaList - Berlin w/o Deilingeweg 6
    2007-08-07, Georg Fischer
    For the discussion of "enctype=multipart/form-data" c.f.
    http://forum.java.sun.com/thread.jspa?threadID=329408&messageID=1340610

    Content-Disposition: attachment; filename="gfis.gif"
    Content-Type: image/gif

    Replacement for ZipInputStream from:
    http://www.oracle.com/global/de/community/tipps/zip/index.html
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
import  org.teherba.xtool.SchemaList;
import  org.teherba.xtool.XmlnsPrefix;
import  org.teherba.xtool.XmlnsXref;
import  org.teherba.xtool.XPathSelect;
import  org.teherba.xtool.web.IndexPage;
import  org.teherba.xtool.web.Messages;
import  org.teherba.common.web.BasePage;
import  org.teherba.common.web.MetaInfPage;
import  java.io.IOException;
import  java.io.InputStream;
import  java.util.Enumeration;
import  java.util.Iterator;
import  java.util.List;
import  java.util.zip.ZipEntry;
import  java.util.zip.ZipFile;
import  java.util.zip.ZipInputStream;
import  javax.servlet.ServletConfig;
import  javax.servlet.ServletContext;
import  javax.servlet.ServletException;
import  javax.servlet.http.HttpServlet;
import  javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import  org.apache.commons.fileupload.FileItem;
import  org.apache.commons.fileupload.FileItemFactory;
import  org.apache.commons.fileupload.disk.DiskFileItemFactory;
import  org.apache.commons.fileupload.servlet.ServletFileUpload;
import  org.apache.log4j.Logger;

/**
 *  Servlet which is the web application wrapper for the commandline tools
 *  <ul>
 *  <li>{@link SchemaList}</li>
 *  <li>{@link XmlnsPrefix}</li>
 *  <li>{@link XmlnsXref}</li>
 *  <li>{@link XPathSelect}</li>
 *  </ul>
 *  @author Dr. Georg Fischer
 */
public class XtoolServlet extends HttpServlet {
    public final static String CVSID = "@(#) $Id: XtoolServlet.java 523 2010-07-26 17:57:50Z gfis $";
    public final static long serialVersionUID = 19470629007L;

    /** log4j logger (category) */
    private Logger log;
    /** common code and messages for auxiliary web pages */
    private BasePage basePage;
    /** name of this application */
    private static final String APP_NAME = "Xtool";
    /** Language for user interface */
    private String language = "en";

    /** Called by the servlet container to indicate to a servlet
     *  that the servlet is being placed into service.
     *  @throws ServletException
     */
    public void init() throws ServletException {
        log = Logger.getLogger(XtoolServlet.class.getName());
        basePage = new BasePage(APP_NAME);
        Messages.addMessageTexts(basePage);
    } // init

    /** Creates the response for a HTTP GET request.
     *  @param request fields from the client input form
     *  @param response data to be sent back the user's browser
     *  @throws IOException
     */
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException {
        generateResponse(request, response);
    } // doGet

    /** Creates the response for a HTTP POST request.
     *  @param request fields from the client input form
     *  @param response data to be sent back the user's browser
     *  @throws IOException
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        generateResponse(request, response);
    } // doPost

    /** Creates the response for a HTTP GET or POST request.
     *  @param request fields from the client input form
     *  @param response data to be sent back the user's browser
     *  @throws IOException
     */
    public void generateResponse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String view     = BasePage.getInputField(request, "view"  , "index");
        try {
            String tool         = "SchemaList";
            String namespace    = "";
            String options      = "";
            String sourceEncoding = "UTF-8";
            String targetEncoding = "UTF-8";

            if (view.equals("index")) {
                // Check that we have a file upload request
                boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                if (! isMultipart) {
                    tool        = basePage.getInputField(request, "tool"    , "SchemaList");
                    namespace   = basePage.getInputField(request, "nsp"     , "");
                    options     = basePage.getInputField(request, "opt"     , "");
                    (new IndexPage    ()).dialog(request, response, basePage, language, tool, namespace, options);
                } else { // no multipart
                    FileItemFactory fuFactory = new DiskFileItemFactory(); // Create a factory for disk-based file items
                    ServletFileUpload upload = new ServletFileUpload(fuFactory); // Create a new file upload handler
                    List/*<FileItem>*/ items = upload.parseRequest(request); // Parse the request
                    FileItem fileItem[] = new FileItem[2];
                    int ifile = 0;
                    Iterator/*<FileItem>*/ iter = items.iterator();
                    while (iter.hasNext()) { // Process the uploaded items
                        FileItem item = (FileItem) iter.next();
                        if (item.isFormField()) {
                            String name  = item.getFieldName();
                            String value = item.getString();
                            if (false) {
                            } else if (name.equals("tool"   )) {
                                tool      = value;
                            } else if (name.equals("nsp"    )) {
                                namespace = value;
                            } else if (name.equals("opt"    )) {
                                options   = value;
                            } else { // unknown field name
                            }
                        } else {
                            fileItem[ifile ++] = item;
                        }
                    } // while FileItem

                    if (false) {
                    } else if (ifile <= 0) { // no file was uploaded
                        basePage.writeMessage(request, response, language, new String[] { "405" });
                    } else { // uploaded file
                        String fileName = fileItem[0].getName();
                        if (false) {

                        } else if (tool.equals("SchemaList")) {
                            SchemaList schemaList = new SchemaList();
                            schemaList.getOptions(new String[]{"-m", "html"});
                            schemaList.getOptions(options.split("\\s+"));
                            String format = schemaList.getMode();
                            if (false) {
                            } else if (format.endsWith("tsv")) {
                                fileName = fileName.replaceAll("\\.xsd", ".txt");
                                response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");
                                response.setContentType("application/vnd.ms-excel");
                            } else if (format.endsWith("plain")) {
                                fileName = fileName.replaceAll("\\.xsd", ".txt");
                                response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");
                                response.setContentType("text/" + format);
                            } else {
                                response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "." + format + "\"");
                                response.setContentType("text/" + format);
                            }
                            schemaList.setFileName(fileName);
                            schemaList.listSchema(fileItem[0].getInputStream(), response.getOutputStream());

                        } else if (tool.equals("XmlnsPrefix")) {
                            XmlnsPrefix xmlnsPrefix = new XmlnsPrefix();
                            response.setCharacterEncoding(targetEncoding);
                            response.setHeader("Content-Disposition", "inline; filename=\"" + fileName);
                            response.setContentType("text/xml");
                            xmlnsPrefix.getOptions(options.split("\\s+"));
                            xmlnsPrefix.process(fileItem[0].getInputStream(), response.getOutputStream());

                        } else if (tool.equals("XmlnsXref")) {
                            XmlnsXref xmlnsXref = new XmlnsXref();
                            response.setCharacterEncoding(targetEncoding);
                            response.setHeader("Content-Disposition", "inline; filename=\"" + fileName);
                            response.setContentType("text/html");
                            if (fileName.endsWith(".zip")) { // imply zip switch
                                options = "-zip " + options;
                            } // imply
                            xmlnsXref.getOptions(0, options.split("\\s+"));
                            xmlnsXref.setFileName(fileName);
                            if (xmlnsXref.isZipped >= 1) {
                                ZipInputStream zis = new ZipInputStream(fileItem[0].getInputStream()); //, "ISO-88519-1");
                                ZipEntry zentry = null;
                                while ((zentry = zis.getNextEntry()) != null) {
                                    xmlnsXref.setFileName(zentry.getName());
                                    xmlnsXref.analyze(zis);
                                } // while entries
                                zis.close();
                            } else {
                                xmlnsXref.analyze(fileItem[0].getInputStream());
                            }
                            xmlnsXref.setWriter(response.getWriter());
                            xmlnsXref.serialize();

                        } else if (tool.equals("XPathSelect")) {
                            XPathSelect xpathSelect = new XPathSelect();
                            response.setCharacterEncoding(targetEncoding);
                            response.setHeader("Content-Disposition", "inline; filename=\"" + fileName);
                            response.setContentType("text/xml");
                            xpathSelect.getOptions(options.split("\\s+"));
                            xpathSelect.apply1(fileItem[0].getInputStream(), response.getOutputStream());

                        } else {
                            basePage.writeMessage(request, response, language, new String[] { "406", tool });
                        }
                    } // uploaded file
                    // isMultipart
                }
            } else if (view.equals("license")
                    || view.equals("manifest")
                    || view.equals("notice")
                    ) {
                (new MetaInfPage    ()).showMetaInf (request, response, basePage, language, view);
            } else {
                basePage.writeMessage(request, response, language, new String[] { "401", "view", view });
            }

        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        } // try
    } // generateResponse

} // XtoolServlet

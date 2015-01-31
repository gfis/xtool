/*  Servlet for several XML utilities:
    - shows a W3C schema as an indented list, 
    - shows and modifies XML namespaces and their prefixes
    @(#) $Id: XtoolServlet.java 523 2010-07-26 17:57:50Z gfis $
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
import  java.io.IOException;
import  java.io.InputStream;
import  java.util.Enumeration;
import  java.util.Iterator;
import  java.util.List;
// import  java.util.zip.ZipEntry;
// import  java.util.zip.ZipInputStream;
import  net.sf.jazzlib.ZipEntry;
import  net.sf.jazzlib.ZipInputStream;
// import  org.apache.tools.zip.ZipEntry;
// import  org.apache.tools.zip.ZipFile;
// import  java.util.zip.ZipInputStream;
import  javax.servlet.RequestDispatcher;
import  javax.servlet.RequestDispatcher;
import  javax.servlet.ServletConfig;
import  javax.servlet.ServletContext;
import  javax.servlet.ServletException;
import  javax.servlet.http.HttpServlet;
import  javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import  javax.servlet.http.HttpSession;
import  org.apache.commons.fileupload.FileItem;
import  org.apache.commons.fileupload.FileItemFactory;
import  org.apache.commons.fileupload.disk.DiskFileItemFactory;
import  org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 *  Servlet which is the web application wrapper for the commandline tools
 *	<ul>
 *	<li>{@link SchemaList}</li>
 *	<li>{@link XmlnsPrefix}</li>
 *	<li>{@link XmlnsXref}</li>
 *	<li>{@link XPathSelect}</li>
 *	</ul>
 *  @author Dr. Georg Fischer
 */
public class XtoolServlet extends HttpServlet {
    public final static String CVSID = "@(#) $Id: XtoolServlet.java 523 2010-07-26 17:57:50Z gfis $";
    // public final static long serialVersionUID = 19470629007L;

    /** Initializes the servlet
     *  @param config configuration data
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
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

    /** Gets the value of an HTML input field, maybe as empty string
     *  @param request request for the HTML form
     *  @param name name of the input field
     *  @return non-null (but possibly empty) string value of the input field
     */
    private String getInputField(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        if (value == null) {
            value = "";
        }
        return value;
    } // getInputField

    /** Creates the response for a HTTP GET or POST request.
     *  @param request fields from the client input form
     *  @param response data to be sent back the user's browser
     *  @throws IOException
     */
    public void generateResponse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String newPage      = ""; // no error so far
            HttpSession session = request.getSession();
            String tool         = "SchemaTree";
            String namespace    = "";
            String options      = "";
            String sourceEncoding = "UTF-8";
            String targetEncoding = "UTF-8";

            FileItemFactory fuFactory = new DiskFileItemFactory(); // Create a factory for disk-based file items
            ServletFileUpload upload = new ServletFileUpload(fuFactory); // Create a new file upload handler
            List/*<1.5#/<FileItem>/#1.5>*/ items = upload.parseRequest(request); // Parse the request
            FileItem fileItem[] = new FileItem[2];
            int ifile = 0;
            Iterator/*<1.5#/<FileItem>/#1.5>*/ iter = items.iterator();
            while (iter.hasNext()) { // Process the uploaded items
                FileItem item = (FileItem) iter.next();
                if (item.isFormField()) {
                    String name  = item.getFieldName();
                    String value = item.getString();
                    session.setAttribute(name, value);
                    if (false) {
                    } else if (name.equals("tool"   )) {
                        tool = value;
                    } else if (name.equals("nsp"    )) {
                        namespace = value;
                    } else if (name.equals("opt"    )) {
                        options = value;
                    } else { // unknown field name
                    }
                } else {
                    fileItem[ifile ++] = item;
                }
            } // while FileItem

            if (newPage.length() > 0) { // fall through
            } else if (ifile <= 0) { // no file was uploaded
                newPage = "/message.jsp";
                session.setAttribute("messno"  , "005");
            } else { // uploaded file
            	String fileName = fileItem[0].getName();
                if (false) {
                } else if (tool.equals("SchemaList")) { 
                    SchemaList list = new SchemaList();
                    list.getOptions(new String[]{"-m", "html"});
                    list.getOptions(options.split("\\s+"));
					String format = list.getMode();
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
                    list.setFileName(fileName);
                    list.listSchema(fileItem[0].getInputStream(), response.getOutputStream());
                } else if (tool.equals("XmlnsPrefix")) {    
                    response.setCharacterEncoding(targetEncoding);
                    response.setHeader("Content-Disposition", "inline; filename=\"" + fileName);
                    response.setContentType("text/xml");
                    XmlnsPrefix prefixer = new XmlnsPrefix();
                    prefixer.getOptions(options.split("\\s+"));
                    prefixer.process(fileItem[0].getInputStream(), response.getOutputStream());
                } else if (tool.equals("XmlnsXref")) {  
                    response.setCharacterEncoding(targetEncoding);
                    response.setHeader("Content-Disposition", "inline; filename=\"" + fileName);
                    response.setContentType("text/html");
					if (fileName.endsWith(".zip")) { // imply zip switch
						options = "-zip " + options;
					} // imply
                    XmlnsXref xref = new XmlnsXref();
                    xref.getOptions(0, options.split("\\s+"));
                    xref.setFileName(fileName);
                    if (xref.isZipped >= 1) {
                        ZipInputStream zis = new ZipInputStream(fileItem[0].getInputStream()); //, "ISO-88519-1");
                        ZipEntry zentry = null;
                        while ((zentry = zis.getNextEntry()) != null) {
                            xref.setFileName(zentry.getName());
                            xref.analyze(zis);
                        } // while entries
                        zis.close();
                    /*
                        ZipFile zif = new ZipFile(fileItem[0]);
                        Enumeration en = zif.getEntries();
					    while (en.hasMoreElements()) {
							ZipEntry zentry = (ZipEntry) en.nextElement();
	                        InputStream zis = zif.getInputStream(zentry);
                            xref.setFileName(zentry.getName());
                            xref.analyze(zis);
					    } // while en
                    */
                    } else {
                        xref.analyze(fileItem[0].getInputStream());
                    }
                    xref.setWriter(response.getWriter());
                    xref.serialize();   
                } else if (tool.equals("XPathSelect")) {    
                    response.setCharacterEncoding(targetEncoding);
                    response.setHeader("Content-Disposition", "inline; filename=\"" + fileName);
                    response.setContentType("text/xml");
                    XPathSelect selector = new XPathSelect();
                    selector.getOptions(options.split("\\s+"));
                    selector.apply1(fileItem[0].getInputStream(), response.getOutputStream());
                } else {
                    newPage = "/message.jsp";
                    session.setAttribute("messno"  , "006"); // unknown tool
                }
            } // uploaded file

            if (newPage.length() > 0) { // error message
                System.out.println("newPage=\"" + newPage + "\", messno=" + session.getAttribute("messno"));
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(newPage);
                dispatcher.forward(request, response);
            }
        } catch (Exception exc) {
            System.err.println(exc.getMessage());
            exc.printStackTrace();
        } // try
    } // generateResponse
    
} // XtoolServlet

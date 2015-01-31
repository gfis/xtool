<%@page import="java.util.Iterator"%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--
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
--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<%--
    @(#) $Id: list.jsp 40 2008-09-08 06:41:22Z gfis $
    2007-11-23: copied from index.jsp
--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>XML Tools</title>
    <link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<%
    String CVSID = "@(#) $Id: list.jsp 40 2008-09-08 06:41:22Z gfis $";
    Object 
    field = session.getAttribute("tool"   	);  String tool       	= (field != null) ? (String) field : "SchemaList";
    field = session.getAttribute("nsp"      );  String namespace    = (field != null) ? (String) field : "";
    field = session.getAttribute("opt"      );  String options      = (field != null) ? (String) field : "";
    field = session.getAttribute("file1"    );  String file1        = (field != null) ? (String) field : "";
    field = session.getAttribute("file2"    );  String file2        = (field != null) ? (String) field : "";
    field = session.getAttribute("mode"     );  String mode         = (field != null) ? (String) field : "html";
    int index = 0;
%>
<body>
    <!--
    tool="<%=tool%>", namespace="<%=namespace%>", options="<%=options%>" 
    -->
    
    <h2>Schema List - Linear Representation of a W3C Schema (XSD) File </h2>
    <form action="servlet" method="post" enctype="multipart/form-data">
        <input type = "hidden" name="view" value="list" />
        <input type = "hidden" name="tool" value="SchemaList" />
        <table cellpadding="8">
            <tr valign="top">
            <%--
                <td rowspan="2"><strong>Tool</strong><br />
                    <select name="tool" size="4">
                    	<option value="SchemaList" selected>SchemaList</option>
                    	<option value="SchemaTree"         >SchemaTree</option>
                    	<option value="XmlnsPrefix"        >XmlnsPrefix</option>
                    	<option value="XmlnsXref"          >XmlnsXref</option>
                    </select>
                </td>
            --%>
                <td>
                    Options<br />
                    <input name="opt"               style="font-family: Courier, monospace"
                    		maxsize="512" size="64" value="<%=options%>" />
                    <br />
                    Input File<br />
                    <input name="file1" type="file" style="font-family: Courier, monospace" 
                            maxsize="512" size="64" value="<%=file1%>"/>
                    <br />
                    &nbsp;
                    <br />
                    <input type="submit" value="Submit" />
                </td>
            </tr>
        </table>
    </form>
    <p />
    <dl>
    	<dt>SchemaList - Display the Element Tree of a W3C Schema</dt>
    	<dd>Options:
    		<ul>
    			<li><tt>-c</tt> show comments with types, restrictions, patterns etc.</li>
    			<li><tt>-e enc</tt> source file encoding, default: UTF-8</li>
    			<li><tt>-e enc</tt> target file encoding, default: UTF-8</li>
    			<li><tt>-f</tt> show first alternative of choices only</li>
    			<li><tt>-m mode</tt> output mode: "html", "plain", "tsv" (for MS-Excel) or "xml"
    			<li><tt>-s</tt> show start tags only (no end tags)</li>
    			<li><tt>-v</tt> generate element values</li>
    		</ul>
    	</dd>
    </dl>
    <br /><a href="docs/documentation.html">Documentation</a>, 
          <a href="docs/api/index.html">API</a>
    <br /><a href="docs/developer.html">Developer Hints</a>
    <br /><a href="docs/bugs.html">Bugs</a>
    <p />
    <font size="-2">
    Questions, remarks to: <a href="mailto:punctum@punctum.com">Dr. Georg Fischer</a>
    </font>
    </p>
    
</body>
</html>

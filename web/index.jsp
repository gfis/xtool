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
    Copyright (C) 2006 Dr. Georg Fischer <punctum@punctum.com>
    @(#) $Id: index.jsp 40 2008-09-08 06:41:22Z gfis $
    2007-12-04: SchemaList instead of SchemaTree
    2007-08-06: copied from xtrans
--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>XML Tools</title>
    <link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<%
    String CVSID = "@(#) $Id: index.jsp 40 2008-09-08 06:41:22Z gfis $";
    Object
    field = session.getAttribute("tool"     );  String tool         = (field != null) ? (String) field : "SchemaList";
    field = session.getAttribute("nsp"      );  String namespace    = (field != null) ? (String) field : "";
    field = session.getAttribute("opt"      );  String options      = (field != null) ? (String) field : "";
    field = session.getAttribute("file1"    );  String file1        = (field != null) ? (String) field : "";
    field = session.getAttribute("file2"    );  String file2        = (field != null) ? (String) field : "";
    int index = 0;
%>
<body>
    <!--
    tool="<%=tool%>", namespace="<%=namespace%>", options="<%=options%>"
    -->

    <h3><a href="/punctum/gmbh/index.html">punctum</a> XML and XSD Tools</h3>
    <form action="servlet" method="post" enctype="multipart/form-data">
        <input type = "hidden" name="view" value="index" />
        <table cellpadding="8">
            <tr valign="top">
                <td rowspan="2"><strong>Tool</strong><br />
                    <select name="tool" size="4">
                        <option value="SchemaList" selected>SchemaList</option>
                        <option value="XmlnsPrefix"        >XmlnsPrefix</option>
                        <option value="XmlnsXref"          >XmlnsXref</option>
                        <option value="XPathSelect"        >XPathSelect</option>
                    </select>
                </td>
                <td>
                    Options<br />
                    <input name="opt"               style="font-family: Courier, monospace"
                            maxsize="512" size="64" value="<%=options%>" />
                    <br />
                    Input File<br />
                    <input name="file1" type="file" style="font-family: Courier, monospace"
                            maxsize="512" size="64" value="<%=file1%>"/>
                <%--
                    <br />
                    2nd Input File<br />
                    <input name="file2" type="file" style="font-family: Courier, monospace"
                            maxsize="512" size="64" value="<%=file2%>"/>
                    <br />
                    Namespace Mappings<br />
                    <textarea name="nsp" cols="20" rows="10" style="font-family: Courier, monospace">
                        <%=namespace%>
                    </textarea>
                    <br />
                    <br />
                --%>
                    &nbsp;
                    &nbsp;
                    <input type="submit" value="Submit" />
                </td>
            </tr>
        </table>
    </form>
    <p />
<dl>
    <dt>SchemaList - List the Element Tree of a W3C XML Schema</dt>
    <dd>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr><td>Options:</td></tr>
        <tr><td><tt>-c</tt></td><td>&nbsp;</td><td> show comments with types, restrictions, patterns etc.</td></tr>
        <tr><td><tt>-e enc</tt></td><td>&nbsp;</td><td> source file encoding, default: UTF-8</td></tr>
        <tr><td><tt>-e enc</tt></td><td>&nbsp;</td><td> target file encoding, default: UTF-8</td></tr>
        <tr><td><tt>-f</tt></td><td>&nbsp;</td><td> show first alternative of choices only</td></tr>
        <tr><td><tt>-m mode</tt></td><td>&nbsp;</td><td> output mode: "html" (default), "plain", "tsv" (for MS-Excel) or "xml"
        <tr><td><tt>-s</tt></td><td>&nbsp;</td><td> show start tags only (no end tags)</td></tr>
        <tr><td><tt>-v</tt></td><td>&nbsp;</td><td> generate element values</td></tr>
    </table>
    <br />
	</dd>
    <dt>XmlnsPrefix - Modify XML Namespace Prefixes</dt>
    <dd>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr><td>Options:</td></tr>
        <tr><td><tt>-e enc</tt></td><td>&nbsp;</td><td> source file encoding, default: UTF-8</td></tr>
        <tr><td><tt>-p old1:new1</tt></td><td>&nbsp;</td><td> change prefix "old1" to prefix "new1" (both may be empty)</td></tr>
        <tr><td><tt>-p old2:new2</tt></td><td>&nbsp;</td><td> ...</td></tr>
    </table>
    <br />
	</dd>
    <dt>XmlnsXref - XML Namespace URI and Prefix Crossreference</dt>
    <dd>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr><td>Options:</td></tr>
        <tr><td><tt>-e enc</tt></td><td>&nbsp;</td><td> source file encoding, default: UTF-8</td></tr>
        <tr><td><tt>-p</tt></td><td>&nbsp;</td><td> show namespace prefixes</td></tr>
        <tr><td><tt>-zip</tt></td><td>&nbsp;</td><td> input file is zip archive</td></tr>
    </table>
    <br />
	</dd>
    <dt>XPathSelect - Apply an XPath expression to an XML file</dt>
    <dd>
    <table border="0" cellspacing="0" cellpadding="0">
    <tr><td>Options:</td></tr>
        <tr><td><tt>-e enc</tt></td><td>&nbsp;</td><td> result file encoding, default: UTF-8</td></tr>
        <tr><td><tt>expr</tt></td><td>&nbsp;</td><td> XPath expression (without functions and variables)</td></tr>
    </table>
    <br />
	</dd>
</dl>
    <a href="documentation.html">Documentation</a>,
    <a href="docs/api/index.html">API</a>
    <br /><a href="metaInf.jsp?view=manifest">Manifest</a>, 
          <a href="metaInf.jsp?view=license" >License</a>, 
          <a href="metaInf.jsp?view=notice"  >References</a>
<%--
    <br /><a href="docs/developer.html">Developer Hints</a>
    <br /><a href="docs/bugs.html">Bugs</a>
--%>
<p>
    <font size="-1">
    Version 1.6, 2007-12-13<br />
    Questions, remarks to: <a href="mailto:punctum@punctum.com">Dr. Georg Fischer</a>
    </font>
</p>

</body>
</html>

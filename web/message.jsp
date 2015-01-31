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
<!-- output some numbered system message
    @(#) $Id: message.jsp 40 2008-09-08 06:41:22Z gfis $
    2006-10-13
-->
<%
final String [] msgText = new String [] 
    { /* 000 */ "unspecified system error"
    , /* 001 */ "invalid direction (must be 'to' or 'from' XML)"
    , /* 002 */ "invalid message number"
    , /* 003 */ "invalid source format"
    , /* 004 */ "invalid target format"
    , /* 005 */ "no input file specified"
    , /* 006 */ "unknown tool"
    } ;
%>
<head>
    <title>Message</title>
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>
<%
    String msg      = (String) session.getAttribute("messno");
    String format   = (String) session.getAttribute("format");
    int msgNo = 000;
    try {
        msgNo = Integer.parseInt(msg);
        if (msgNo < 1 || msgNo >= msgText.length) {
            msgNo = 002;
        }
    } catch (Exception exc) {
    }
    
%>
<p>
Message No. <%= msg %>
</p>
<h2><%= msgText[msgNo] %></h2>
<h2>format="<%=format%>"</h2>
</body>
</html>

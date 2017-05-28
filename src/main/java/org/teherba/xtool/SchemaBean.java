/*  SchemaBean.java - Bean for a start or end of an element in a linear representation of a W3C Schema
 *  @(#) $Id: SchemaBean.java 523 2010-07-26 17:57:50Z gfis $
    2017-05-28: javadoc 1.8
 *  2012-02-13: .trim() in method 'emphasize'
 *  2008-07-25: renamed from 'ToothBean'
 *  2008-06-17: a lot more W3C datatypes
 *  2008-02-13: Java 1.5 types
 *  2007-11-09: representation methods
 *  2007-09-20, Georg Fischer: compareTo, constructor etc.
 *
 *  Caution, this file should be encoded in UTF-8: äöüÄÖÜß
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
import  org.teherba.xtool.SchemaBeanBase;
import  java.util.HashMap; // for restrictions, enumerations, attributes
import  java.util.Iterator;
import  java.util.regex.Matcher;
import  java.util.regex.Pattern;
import  java.util.TreeMap; // for sorted attributes
import  java.util.TreeSet; // for sorted enumerations
import  org.w3c.dom.Node;
import  org.w3c.dom.NamedNodeMap;
import  org.apache.log4j.Logger;

/** Bean for a start or end of an element in a linear representation of a W3C Schema.
 *  A "bean" is an element of a "array", an array list of beans.
 *  Extends the generated {@link SchemaBeanBase} by unconventional properties,
 *  enumerations, value generation and representation methods.
 *  @author Dr. Georg Fischer
 */
public class SchemaBean extends SchemaBeanBase {
    /** Source code version */
    public static final String CVSID = "@(#) $Id: SchemaBean.java 523 2010-07-26 17:57:50Z gfis $";

    /** log4j logger (category) */
    private static Logger log;

    /** code for start tag */
    public static final int START_TAG           = 1;
    /** code for end   tag */
    public static final int END_TAG             = 9;

    /** tag for start of HTML or XML cell  */
    public static final String START_CELL       = "<td>";
    /** tag for end   of HTML or XML cell  */
    public static final String   END_CELL       = "</td>";

    /** do not display */
    public static final int DISPLAY_NONE        = 0;
    /** display as element */
    public static final int DISPLAY_ELEMENT     = 1;
    /** display as attribute */
    public static final int DISPLAY_ATTRIBUTE   = 2;
    /** display as comment */
    public static final int DISPLAY_COMMENT     = 3;
    /** display as simple element with start tag, value and end tag */
    public static final int DISPLAY_SIMPLE      = 4;

    /** a high value for maxOccurs=unbounded */
    public static final int UNBOUNDED           = 0x19470629;
    /** string which starts and separates XPath elements */
    public static final String XPATH_SEPARATOR  = "/";

    // Caution, the following codes must be kept in parallel with {@link org.teherba.xtool.SchemaList.formats} */
    /** code for HTML output format */
    public static final int MODE_HTML           = 0;
    /** code for plain text output format */
    public static final int MODE_PLAIN          = 1;
    /** code for tab separated values, for Excel / spreadsheet processors */
    public static final int MODE_TSV            = 2;
    /** code for XML output format */
    public static final int MODE_XML            = 3;

    /** Initialization of static variables
     */
    static {
        log = Logger.getLogger(SchemaBean.class.getName());
    }

    /** No-args Constructor
     */
    public SchemaBean() {
        // some default properties:
        setStartEnd(START_TAG);
        setDisplayMode(DISPLAY_NONE);
        setBaseType("");
        setDataType("");
        setMinOccurs(1);
        setMaxOccurs(1);
        restrictions = null;
        setPosition (1);
        setXPath(""); // fits for superroot element
    } // constructor 0

    /** Constructor which creates the bean from a schema node
     *  as child of a mother element
     *  @param mother mother of this child element
     *  @param node node in a W3C schema with attributes and other children
     */
    public SchemaBean(Node node, SchemaBean mother) {
        this();
        setNode(node);
        NamedNodeMap attrs = node.getAttributes();
        Node nameAttr = attrs.getNamedItem("name");
        if (nameAttr == null) {
            nameAttr = attrs.getNamedItem("ref");
        }
        if (nameAttr != null) {
            setNodeName(nameAttr.getNodeValue());
        }
        setLevel(mother.getLevel() + 1);
        setAnchIndex(mother.getAnchIndex()); // default: describe same anchestor
    } // constructor 2

    //---------------------------
    // additional property access
    //---------------------------

    /** node - original schema node */
    protected Node node;

    /** Sets node - original schema node
     *  @param node original schema node
     */
    public void setNode(Node node) {
        this.node = node;
    } // setNode

    /** Gets node - original schema node
     *  @return original schema node
     */
    public Node getNode() {
        return node;
    } // getNode

    //----------------
    /** hashmap for attributes, restrictions etc. */
    private HashMap<String, Object> restrictions;

    /** Puts an Object into the hashmap for attributes, restrictions and so on,
     *  creates the hash map if it is not yet allocated.
     *  @param key name of the restriction element: pattern, minInclusive etc.
     *  @param value value of the restriction element: regular expression, 1 etc.
     */
    public void putRestriction(String key, Object value) {
        if (restrictions == null) {
            restrictions = new HashMap<String, Object>(16);
        }
        restrictions.put(key, value);
    } // putRestriction

    /** key for attributes in the restrictions map */
    public static final String ATTRIBUTES_KEY = "attribute";

    /** Gets the map of attributes from the restrictions
     *  @return ordered map of attributes stored in the hashmap for attributes, restrictions etc.
     */
    public TreeMap<String, SchemaBean> getAttributeMap() {
        TreeMap<String, SchemaBean> result = null;
        if (restrictions != null) {
            result = (TreeMap<String, SchemaBean>) restrictions.get(ATTRIBUTES_KEY);
        } // restrictions != null
        if (result == null) {
            result = new TreeMap<String, SchemaBean>();
        }
        return result;
    } // getAttributeMap

    /** Puts a reference to an attribute bean into the TreeMap for attributes
     *  in the hashmap for restrictions;
     *  creates the hash map and the tree map if they are not yet allocated.
     *  @param attrName name of the attribute to be referenced
     *  @param bean2 the attribute's bean in the array
     */
    public void putAttribute(String attrName, SchemaBean bean2) {
        if (restrictions == null) {
            restrictions = new HashMap<String, Object>(16);
        }
        TreeMap<String, SchemaBean> attributes = getAttributeMap();
        attributes.put(attrName, bean2);
        putRestriction(ATTRIBUTES_KEY, attributes);
    } // putAttribute

    /** key for enumeration in the restrictions map */
    public static final String ENUMERATION_KEY = "enumeration";

    /** Gets the enumeration from the restrictions
     *  @return ordered set of strings in the hashmap for attributes, restrictions etc.
     */
    public TreeSet<String> getEnumerationSet() {
        TreeSet<String> result = null;
        if (restrictions != null) {
            result = (TreeSet<String>) restrictions.get(ENUMERATION_KEY);
        } // restrictions != null
        if (result == null) {
            result = new TreeSet<String>();
        }
        return result;
    } // getEnumerationSet

    /** Gets a value from the hashmap for attributes, restrictions as String
     *  @param key attribute name of the restriction
     *  @return String in the hashmap for attributes, restrictions etc.
     */
    private String getStringRestriction(String key) {
        String result = null;
        if (restrictions != null) {
            Object obj = restrictions.get(key);
            if (obj != null) {
                result = (String) obj;
            }
        } // restrictions != null
        return result;
    } // getStringRestriction

    //----------------
    // utility methods
    //----------------

    /** Compares this bean - its tag and data type - with another one.
     *  Simplified elements are not supported - the comparision must happen before {@link SchemaArray#simplify}.
     *  @param bean2 right comparision operand
     *  @return -1 / 0 / 1 if this bean1 is &lt; / = / &gt; bean2
     */
    public int compareTo(SchemaBean bean2) {
        int result = this.getNodeName().compareTo(bean2.getNodeName());
        if (result == 0) {
            result = this.getDataType().compareTo(bean2.getDataType());
        }
        return result;
    } // compareTo

    /** Determines whether this bean has a broader enumeration set than the parameter bean.
     *  @param bean2 restricted bean
     *  @return whether this bean is broader than the parameter bean
     */
    public boolean containsEnumeration(SchemaBean bean2) {
        boolean result = true;
        return result;
    } // containsEnumeration

    /** Determines whether this bean has a broader definition than the parameter bean.
     *  The two beans must be "equal" with respect to tag and data type.
     *  This is an oversimplified implementation which - for example - does not (yet) care for
     *  precise pattern and fraction containment.
     *  Simplified elements are not supported - the comparision must happen before {@link SchemaArray#simplify}.
     *  @param bean2 restricted bean
     *  @return whether this bean is broader than the parameter bean
     */
    public boolean contains(SchemaBean bean2) {
        boolean result= this.getNodeName().compareTo(bean2.getNodeName()) == 0
                    &&  this.getMinOccurs() <= bean2.getMinOccurs()
                    &&  this.getMaxOccurs() >= bean2.getMaxOccurs()
                    ;
        return result;
    } // contains

    //-----------------
    // value generation
    //-----------------

    /** pattern for character sequences */
    private static final Pattern CHAR_SEQ = Pattern.compile("((\\w+)\\{(\\d+)\\,(\\d+)\\})");

    /** Generates an element's value (content) from a
     *  regular expression pattern terminated by a slash, for example
     *  <tt>[A-Z]{6,6}[A-Z2-9][A-NP-Z0-9]([A-Z0-9]{3,3}){0,1}/</tt> or
     *  <tt>[+]{0,1}[0-9]{1,15}/</tt>.
     *  This is an oversimplified algorithm which works well for SEPA,
     *  but which will fail in the general case.
     *  @param pat regular expression pattern
     *  @return generated value
     */
    private String getValueFromPattern(String pat) {
        StringBuffer result = new StringBuffer(64);
        pat = pat
                .replaceAll("\\{0,1\\}"           , "") // optional -> take one
                .replaceAll("[\\[\\(\\)\\]\\/\\-]", "")
                ;
        // now we have strings of characters/digits interspersed with {n,m} constructions
        Matcher mat = CHAR_SEQ.matcher(pat);
        while (mat.find()) {
            int igrp = 1;
            while (igrp < mat.groupCount()) {
                String word = mat.group(igrp + 1);
                int min = 1;
                int max = 1;
                try {
                    min = Integer.parseInt(mat.group(igrp + 2));
                    max = Integer.parseInt(mat.group(igrp + 3));
                } catch (Exception exc) {
                    // ignore numerical errors
                }
                String part = word;
                while (part.length() < min) {
                    part += word;
                    // "AAAAAAAAAAAAAAAA".substring(0, min - result.length());
                } // while
                if (part.length() > max) {
                    part = part.substring(0, max);
                }
                result.append(part);
                igrp += 4;
            } // while igrp
        } // if matches
        return result.toString();
    } // getValueFromPattern

    /** Generates an element's generic value (content) from the bean's other properties
     *  @return some standard string value
     *  See <a href="http://www.w3.org/TR/2001/REC-xmlschema-2-20010502/">http://www.w3.org/TR/2001/REC-xmlschema-2-20010502</a>
     *  or a later version of W3C's Recommendation, XML Schema Part 2: Datatypes
<pre>
3.2 Primitive datatypes
3.2.1 string
3.2.2 boolean
3.2.3 decimal
3.2.4 float
3.2.5 double
3.2.6 duration
3.2.7 dateTime
3.2.8 time
3.2.9 date
3.2.10 gYearMonth
3.2.11 gYear
3.2.12 gMonthDay
3.2.13 gDay
3.2.14 gMonth
3.2.15 hexBinary
3.2.16 base64Binary
3.2.17 anyURI
3.2.18 QName
3.2.19 NOTATION
3.3 Derived datatypes
3.3.1 normalizedString
3.3.2 token
3.3.3 language
3.3.4 NMTOKEN
3.3.5 NMTOKENS
3.3.6 Name
3.3.7 NCName
3.3.8 ID
3.3.9 IDREF
3.3.10 IDREFS
3.3.11 ENTITY
3.3.12 ENTITIES
3.3.13 integer
3.3.14 nonPositiveInteger
3.3.15 negativeInteger
3.3.16 long
3.3.17 int
3.3.18 short
3.3.19 byte
3.3.20 nonNegativeInteger
3.3.21 unsignedLong
3.3.22 unsignedInt
3.3.23 unsignedShort
3.3.24 unsignedByte
3.3.25 positiveInteger
</pre>
     */
    public String toValueString() {
        StringBuffer result = new StringBuffer(64);
        // String dataType = getDataType(); // without the prefix
        TreeSet<String> sortedEnums = getEnumerationSet();
        if (sortedEnums != null && sortedEnums.size() > 0) {
            result.append((String) sortedEnums.first());
        } else if (dataType != null) { // contains a W3C data type
            if (false) {
            } else if (dataType.startsWith("boolean"            )) {
                result.append("true");
            } else if (dataType.startsWith("decimal"            )) {
                result.append("1");
            } else if (dataType.startsWith("integer"            )) {
                result.append("1");
            } else if (dataType.startsWith("int"                )) {
                result.append("1");
            } else if (dataType.startsWith("short"              )) {
                result.append("1");
            } else if (dataType.startsWith("byte"               )) {
                result.append("1");
            } else if (dataType.startsWith("long"               )) {
                result.append("1");
            } else if (dataType.startsWith("nonPositiveInteger" )) {
                result.append("-1");
            } else if (dataType.startsWith("nonNegativeInteger" )) {
                result.append("1");
            } else if (dataType.startsWith("positiveInteger"    )) {
                result.append("1");
            } else if (dataType.startsWith("unsignedLong"       )) {
                result.append("1");
            } else if (dataType.startsWith("unsignedInt"        )) {
                result.append("1");
            } else if (dataType.startsWith("unsignedShort"      )) {
                result.append("1");
            } else if (dataType.startsWith("unsignedByte"       )) {
                result.append("1");
            } else if (dataType.startsWith("negativeInteger"    )) {
                result.append("-1");
            } else if (dataType.startsWith("dateTime"           )) {
                result.append("2007-06-29T04:30:00Z");
            } else if (dataType.startsWith("date"               )) {
                result.append("2007-06-29");
            } else if (dataType.startsWith("float"              )) {
                result.append("-1.85E2");
            } else if (dataType.startsWith("double"             )) {
                result.append("2.99E8"); // speed of light: m/s?
            } else if (dataType.startsWith("duration"           )) {
                result.append("P60Y11M18D"); // my age today
            } else if (dataType.startsWith("time"               )) {
                result.append("04:30:00Z");
            } else if (dataType.startsWith("gYearMonth"         )) {
                result.append("1947-06");
            } else if (dataType.startsWith("gYear"              )) {
                result.append("1947");
            } else if (dataType.startsWith("gMonthDay"          )) {
                result.append("06-29");
            } else if (dataType.startsWith("gMonth"             )) {
                result.append("06");
            } else if (dataType.startsWith("gDay"               )) {
                result.append("29");
            } else if (dataType.startsWith("hexBinary"          )) {
                result.append("1D"); // = decimal 29
            } else if (dataType.startsWith("base64Binary"       )) {
                result.append("2906"); // = 4 * 2**6 = 3 * 2**8, 3 bytes
            } else if (dataType.startsWith("anyURI"             )) {
                result.append("urn:iso:std:iso:20022");
            } else if (dataType.startsWith("NCName"             )) {
                result.append("NCName");
            } else if (dataType.startsWith("normalizedString"   )) {
                result.append("normalizedString");
            } else if (dataType.startsWith("string"             )) {
                String baseType = getBaseType();
                String pattern  = getStringRestriction("pattern");
                if (false) {
                } else if (pattern != null) { // has a pattern
                    if (false) {
                    } else if (baseType.startsWith("CurrencyCode"               )) {
                        result.append("EUR");
                    } else if (baseType.startsWith("IBANIdentifier"             )) {
                        result.append("DE28500400000123456589");
                    } else if (baseType.startsWith("BICIdentifier"              )) {
                        result.append("COBADEFF");
                    } else if (baseType.startsWith("BEIIdentifier"              )) {
                        result.append("BEIADEFF");
                    } else if (baseType.startsWith("CHIPSUniversalIdentifier"   )) {
                        result.append("CH012345");
                    } else {
                        result.append(getValueFromPattern(pattern));
                    }
                } else { // length restriction
                    int min = 1;
                    int max = 1;
                    try {
                        min = Integer.parseInt(getStringRestriction("minLength"));
                        max = Integer.parseInt(getStringRestriction("maxLength"));
                    } catch (Exception exc) {
                    }
                    result.append(baseType);
                    if (result.length() < min) {
                        result.append("ABCDEFGHIJKLMNOPQRSTUVWXYZ".substring(0, min - result.length()));
                    } // too short
                    if (result.length() > max) {
                        result.setLength(max);
                    } // too long
                } // length restriction
            } else {
                // unknown W3C data type
            }
        } // if dataType != null
        return result.toString();
    } // toValueString

    //-----------------------
    // representation methods
    //-----------------------

    /** Represents a "less than" character in the output format
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return either "&amp;lt;" or "&lt;"
     */
    public static String lt(int mode) {
        String result = "<";
        switch (mode) {
            case MODE_HTML:
                result = "&lt;";
                break;
            case MODE_TSV:
            case MODE_PLAIN:
            case MODE_XML:
            default:
                break;
        } // switch mode
        return result;
    } // lt

    /** Represents a "greater than" character in the output format
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return either "&amp;gt;" or "&gt;"
     */
    public static String gt(int mode) {
        String result = ">";
        switch (mode) {
            case MODE_HTML:
                result = "&gt;";
                break;
            case MODE_TSV:
            case MODE_PLAIN:
            case MODE_XML:
            default:
                break;
        } // switch mode
        return result;
    } // gt

    /** Represents an opening comment mark
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return either "&amp;lt;!--" or "&lt;!--"
     */
    public static String ltComt(int mode) {
        String result = "<!--";
        switch (mode) {
            case MODE_HTML:
                result = "&lt;!--";
                break;
            case MODE_TSV:
                result = "";
                break;
            case MODE_PLAIN:
            case MODE_XML:
            default:
                break;
        } // switch mode
        return result;
    } // ltComt

    /** Represents a closing comment mark
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return either "--&amp;gt;" or "--&gt;"
     */
    public static String gtComt(int mode) {
        String result = "-->";
        switch (mode) {
            case MODE_HTML:
                result = "--&gt;";
                break;
            case MODE_TSV:
                result = "";
                break;
            case MODE_PLAIN:
            case MODE_XML:
            default:
                break;
        } // switch mode
        return result;
    } // gtComt

    /** Returns some text with special HTML emphasis defined by a Cascaded Stylesheet property
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @param css CSS class designator for emphasis;
     *  the styles for the classes are defined in the HTML header in {@link SchemaArray#toHeaderString}
     *  @param text text to be emphasized
     *  @return emphasized string
     */
    public static String emphasize(int mode, String css, String text) {
        return (mode == MODE_HTML)
                ? "<span class=\"" + css + "\">" + text.trim() + "</span>"
                : text.trim()
                ;
    } // emphasize

    /** Represents the starting tag of the element
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string representing the start tag
     */
    public String toStartElementString(int mode) {
        StringBuffer result = new StringBuffer(64);
        switch (displayMode) {
            default:
            case DISPLAY_NONE:
                break;
            case DISPLAY_SIMPLE:
            case DISPLAY_ELEMENT:
                result.append(lt(mode));
                if (mode == MODE_HTML && getMaxOccurs() > 0) {
                    result.append("<a href=\"data:text/plain," + getXPath() + "\">"
                            + emphasize(mode, "bold", this.getNodeName()) + "</a>");
                } else {
                    result.append(this.getNodeName());
                }
                result.append(toAttributesString(mode));
                result.append(gt(mode));
                break;
            case DISPLAY_ATTRIBUTE:
                result.append(lt(mode) + "!--@");
                if (mode == MODE_HTML) {
                    result.append("<a href=\"data:text/plain," + getXPath() + "\">"
                            + emphasize(mode, "bold", this.getNodeName()) + "</a>");
                } else {
                    result.append(this.getNodeName());
                }
                result.append("--" + gt(mode));
                break;
            case DISPLAY_COMMENT:
                result.append(lt(mode) + "!--");
                result.append(this.getNodeName());
                result.append("--" + gt(mode));
                break;
        } // switch displayMode
        return result.toString();
    } // toStartElementString

    /** Represents the ending tag of the element
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string representing the end tag
     */
    public String toEndElementString(int mode) {
        StringBuffer result = new StringBuffer(64);
        switch (displayMode) {
            default:
            case DISPLAY_NONE:
                break;
            case DISPLAY_SIMPLE:
            case DISPLAY_ELEMENT:
                result.append(lt(mode) + "/");
                result.append(this.getNodeName());
                result.append(gt(mode));
                break;
        /*  attributes have no twin
            case DISPLAY_ATTRIBUTE:
                result.append("\"");
                break;
        */
            case DISPLAY_COMMENT:
                result.append(lt(mode) + "!--/");
                result.append(this.getNodeName());
                result.append("--" + gt(mode));
                break;
        } // switch displayMode
        return result.toString();
    } // toEndElementString

    /** Represents the (complex, simple) base type of the element
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string representing the base type
     */
    public String toBaseTypeString(int mode) {
        StringBuffer result = new StringBuffer(64);
        switch (mode) {
            case MODE_HTML:
            case MODE_PLAIN:
            case MODE_TSV:
            case MODE_XML:
            default:
                result.append(this.getBaseType());
                break;
        } // switch mode
        return result.toString();
    } // toBaseTypeString

    /** Represents the W3C Schema data type (xs:string, xs:decimal and so on) of the element
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string representing the W3C Schema data type
     */
    public String toDataTypeString(int mode) {
        StringBuffer result = new StringBuffer(64);
        switch (mode) {
            case MODE_HTML:
            case MODE_PLAIN:
            case MODE_TSV:
            case MODE_XML:
            default:
                result.append(this.getDataType());
                break;
        } // switch mode
        return result.toString();
    } // toDataTypeString

    /** Represents the indentation of a start tag (0 = root level)
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string representing the indentation (spaces or tabs)
     */
    public String toLevelString(int mode) {
        StringBuffer result = new StringBuffer(128);
        int level = getLevel() - 1;
        while (level > 0) {
            switch (mode) {
                case MODE_HTML:
                    result.append("&nbsp;&nbsp;");
                    break;
                case MODE_PLAIN:
                    result.append("  ");
                    break;
                case MODE_TSV:
                    result.append("  "); // 2 hard spaces?
                    break;
                case MODE_XML:
                    result.append("  ");
                    break;
                default:
                    result.append("  ");
                    break;
            } // switch mode
            level --;
        } // while level
        return result.toString();
    } // toLevelString

    /** Represents the (abbreviated) XPath to the element
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string representing the XPath expression
     */
    public String toXPathString(int mode) {
        StringBuffer result = new StringBuffer(128);
        result.append(getXPath());
        switch (mode) {
            case MODE_HTML:
                break;
            case MODE_PLAIN:
                break;
            case MODE_TSV:
                break;
            case MODE_XML:
                break;
            default:
                break;
        } // switch mode
        return result.toString();
    } // toXPathString

    /** representation of default cardinality */
    private static final String DEFAULT_CARD = " ";

    /** Represents the cardinality
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string representing minOccurs and maxOccurs
     */
    private String toCardinalityString_99(int mode) {
        String result = "";
        if (false) {
        } else if (minOccurs == 0) {
            if (false) {
            } else if (maxOccurs == 0) {
                log.warn("minOccurs=\"0\" and maxOccurs=\"0\" - strange?"); // should not occur
            } else if (maxOccurs == 1) {
                result = "?";
            } else if (maxOccurs == UNBOUNDED) {
                result = "*";
            } else {
                result = "{" + minOccurs + "," + maxOccurs + "}";
            } // if minOccurs == 0
        } else if (minOccurs == 1) {
            if (false) {
            } else if (maxOccurs == 0) {
                log.warn("minOccurs=\"1\" and maxOccurs=\"0\" - strange?"); // should not occur
            } else if (maxOccurs == 1) {
                result = DEFAULT_CARD;
            } else if (maxOccurs == UNBOUNDED) {
                result = "+";
            } else {
                result = "{" + minOccurs + "," + maxOccurs + "}";
            } // if minOccurs == 1
        } else if (minOccurs == UNBOUNDED) {
            log.warn("minOccurs=\"unbounded\" - strange?"); // should not occur
        } else {
            if (false) {
            } else if (maxOccurs == 0) {
                log.warn("minOccurs=\"" + minOccurs + "\" and maxOccurs=\"0\" - strange?"); // should not occur
            } else if (maxOccurs == 1) {
                log.warn("minOccurs=\"" + minOccurs + "\" and maxOccurs=\"1\" - strange?"); // should not occur
            } else if (maxOccurs == UNBOUNDED) {
                result = "{" + minOccurs + ",*}";
            } else {
                result = "{" + minOccurs + "," + maxOccurs + "}";
            } // if maxOccurs
        } // if minOccurs

        switch (mode) {
            case MODE_HTML:
                break;
            case MODE_PLAIN:
                break;
            case MODE_TSV:
                break;
            case MODE_XML:
                break;
            default:
                break;
        } // switch mode
        return result;
    } // toCardinalityString

    /** Represents the multiplicity as used by SWIFT; semantically equivalent to the cardinality.
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string of the form [minOccurs..maxOccurs]
     */
    public String toMultiplicityString(int mode) {
        StringBuffer result = new StringBuffer(16);
        result.append("[");
        if (minOccurs == UNBOUNDED) {
            result.append("n");
        } else {
            result.append(Integer.toString(minOccurs));
        }
        result.append("..");
        if (maxOccurs == UNBOUNDED) {
            result.append("n");
        } else {
            result.append(Integer.toString(maxOccurs));
        }
        result.append("]");

        switch (mode) {
            case MODE_HTML:
                break;
            case MODE_PLAIN:
                break;
            case MODE_TSV:
                break;
            case MODE_XML:
                break;
            default:
                break;
        } // switch mode
        return result.toString();
    } // toMultiplicityString

    /** Represents a sorted map of attributes stored in the restrictions map.
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string with all concatenated attributes, separated by space.
     */
    private String toAttributesString(int mode) {
        StringBuffer result = new StringBuffer(16);
        if (restrictions != null)
        try {
            TreeMap<String, SchemaBean> map = getAttributeMap();
            if (map != null) {
                Iterator<String> iter = map.keySet().iterator();
                while (iter.hasNext()) {
                    result.append(" ");
                    String key = (String) iter.next();
                    result.append(emphasize(mode, "bold", key));
                    result.append("=\"");
                    SchemaBean bean2 = (SchemaBean) map.get(key);
                    result.append(emphasize(mode, "valu", bean2.toValueString()));
                    result.append("\"");
                } // while iter
            } // map != null
        } catch (Exception exc) {
            log.error("toAttributesString " + exc.getMessage(), exc);
        }

        switch (mode) {
            case MODE_HTML:
            case MODE_PLAIN:
            case MODE_TSV:
            case MODE_XML:
            default:
                break;
        } // switch mode
        return result.toString();
    } // toAttributesString

    /** Represents a sorted list of enumerations (fixed string codes).
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string with all concatenated enumerations, delimited by "|"
     */
    private String toEnumerationsString(int mode) {
        StringBuffer result = new StringBuffer(16);
        if (restrictions != null)
        try {
            TreeSet<String> sortedEnums = getEnumerationSet();
            if (sortedEnums != null) {
                result.append(" ");
                Iterator<String> iter = sortedEnums.iterator();
                boolean first = true;
                while (iter.hasNext()) {
                    if (first) {
                        first = false;
                    } else {
                        result.append("|");
                    }
                    result.append("\"");
                    result.append((String) iter.next());
                    result.append("\"");
                } // while iter
            } // sortedEnums != null
        } catch (Exception exc) {
            log.error("toEnumerationString " + exc.getMessage(), exc);
        }

        switch (mode) {
            case MODE_HTML:
            case MODE_PLAIN:
            case MODE_TSV:
            case MODE_XML:
            default:
                break;
        } // switch mode
        return result.toString();
    } // toEnumerationsString

    /** Represents the various restrictions stored in the map.
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string with all concatenated restrictions, each starting with a space
     */
    public String toRestrictionsString(int mode) {
        StringBuffer result = new StringBuffer(16);
        if (restrictions != null)
        try {
            String restr = null;
            restr = getStringRestriction("minLength"        );
            if (restr != null) {
                result.append(" ");
                result.append(restr);
            }
            restr = getStringRestriction("maxLength"        );
            if (restr != null) {
                result.append("..");
                result.append(restr);
            }
            restr = getStringRestriction("minInclusive"     );
            if (restr != null) {
                result.append(" " + gt(mode) + "=");
                result.append(restr);
            }
            restr = getStringRestriction("minExclusive"     );
            if (restr != null) {
                result.append(" " + gt(mode));
                result.append(restr);
            }
            restr = getStringRestriction("maxInclusive"     );
            if (restr != null) {
                result.append("," + lt(mode) + "=");
                result.append(restr);
            }
            restr = getStringRestriction("maxExclusive"     );
            if (restr != null) {
                result.append("," + lt(mode));
                result.append(restr);
            }
            restr = getStringRestriction("pattern"          );
            if (restr != null) {
                result.append(" /" + restr + "/");
            }
            restr = getStringRestriction("totalDigits"      );
            if (restr != null) {
                result.append(" L");
                result.append(restr);
            }
            restr = getStringRestriction("fractionDigits"   );
            if (restr != null) {
                result.append(".");
                result.append(restr);
            }
            result.append(toEnumerationsString(mode));
        } catch (Exception exc) {
            log.error("toRestrictionsString " + exc.getMessage(), exc);
        }

        switch (mode) {
            case MODE_HTML:
            case MODE_PLAIN:
            case MODE_TSV:
            case MODE_XML:
            default:
                break;
        } // switch mode
        return result.toString();
    } // toRestrictionsString

    /** Represents the machine and human readable documentation stored in the map.
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @return a string with all concatenated documentation
     */
    public String toDocumentationString(int mode) {
        StringBuffer result = new StringBuffer(16);
        if (restrictions != null)
        try {
            String restr = null;
            restr = getStringRestriction("appInfo");
            if (restr != null) {
                result.append(" ! ");
                result.append(emphasize(mode, "doct", restr));
            }
            restr = getStringRestriction("documentation");
            if (restr != null) {
                result.append(" ! ");
                result.append(emphasize(mode, "doct", restr));
            }
        } catch (Exception exc) {
            log.error("toDocumentationString " + exc.getMessage(), exc);
        }

        switch (mode) {
            case MODE_HTML:
            case MODE_PLAIN:
            case MODE_TSV:
            case MODE_XML:
            default:
                break;
        } // switch mode
        return result.toString();
    } // toDocumentationString

    /** Represents an entry in the array: element, attribute, comment
     *  @param mode output format: HTML, plain text, tab separated values, XML
     *  @param startTagsOnly 1 if only start tags (and no end tags) should be shown
     *  @param withComments 1 if comments (types, restrictions, annotations) should be shown for some modes
     *  @param withValues 1 if values should be generated and shown for some modes
     *  @return a string representing the entry
     */
    public String toString(int mode, int startTagsOnly, int withComments, int withValues) {
        StringBuffer result = new StringBuffer(256);
        String separator = " ";
        switch (mode) {
            case MODE_TSV:
                separator = "\t";
                // fall thru
            case MODE_HTML:
            case MODE_PLAIN:
            case MODE_XML:
            default:
                switch (displayMode) {
                    default:
                    case DISPLAY_NONE:
                        break;
                    case DISPLAY_COMMENT:
                        result.append(toLevelString             (mode));
                        if (startEnd == START_TAG) {
                            result.append(toStartElementString  (mode));
                        } else { // END_TAG
                            result.append(toEndElementString    (mode));
                        }
                        break;
                    case DISPLAY_ATTRIBUTE: // attributes have no twin
                    case DISPLAY_SIMPLE:
                    case DISPLAY_ELEMENT:
                        result.append(toLevelString             (mode));
                        if (startEnd == START_TAG) {
                            result.append(toStartElementString  (mode));
                            if (withValues > 0) {
                                result.append(emphasize(mode, "valu", toValueString()));
                            }
                            if (startTagsOnly == 0 && displayMode == DISPLAY_SIMPLE) {
                                result.append(toEndElementString    (mode));
                            }
                            if (withComments > 0 && getMaxOccurs() > 0) {
                                result.append(ltComt(mode));

                                result.append(toMultiplicityString  (mode));
                                result.append(separator);
                                result.append(toBaseTypeString      (mode));
                                result.append(separator);
                                result.append(toDataTypeString      (mode));
                                result.append(separator);
                                result.append(toRestrictionsString  (mode));
                                result.append(separator);
                                result.append(toDocumentationString (mode));
                                result.append(gtComt(mode));
                            } // if maxOccurs > 0
                        } else if (startTagsOnly == 0) { // END_TAG
                            result.append(toEndElementString    (mode));
                        }
                        break;
                } // switch displayMode
                break;
        } // switch mode
        if (mode == MODE_HTML) {
            result.append("<br />");
        } // html
        return result.toString();
    } // toString

} // class SchemaBean

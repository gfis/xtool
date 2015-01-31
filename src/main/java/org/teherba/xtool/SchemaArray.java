/*  SchemaArray.java - Linear, indented representation of the nodes in the DOM of a W3C Schema (XSD file)
 *  @(#) $Id: SchemaArray.java 523 2010-07-26 17:57:50Z gfis $
 *	2012-02-13: <meta> before <title> was not closed; "all" analoguous to "sequence"
 *	2008-07-25: renamed from Comb
 *  2007-11-09: Georg Fischer
 *
 *  Caution, this file contains HTML and should be encoded in UTF-8: äöüÄÖÜß
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
import  org.teherba.xtool.PathElement;
import  org.teherba.xtool.PathStack;
import  java.io.InputStream;
import  java.io.OutputStream;
import  java.io.PrintStream;
import  java.text.SimpleDateFormat;
import  java.util.ArrayList;
import  java.util.TreeMap;
import  java.util.TreeSet; // sorted set
import  javax.xml.parsers.DocumentBuilder;
import  javax.xml.parsers.DocumentBuilderFactory;
import  org.w3c.dom.Document;
import  org.w3c.dom.Node;
import  org.w3c.dom.NodeList;
import  org.w3c.dom.NamedNodeMap;
import	org.xml.sax.InputSource;
import  org.apache.log4j.Logger;

/** Linear, indented representation (in the array) of all nodes which are visited
 *  during a width-first walk through the nodes in the DOM of a W3C Schema (XSD file).
 *  Starting the walk with the root element, all children of a node are
 *  inserted behind the node, and then they are in turn investigated.
 *  The elements stored in a {@link SchemaArray} are {@link SchemaBean}s.
 *  <p>
 *  Parallel to the tree walk, a stack of (real, instance) elements is maintained.
 *  This stack always represents the XPath to the element of the instance.
 *
 *  @author Dr. Georg Fischer
 */
public class SchemaArray extends ArrayList/*<1.5*/<SchemaBean>/*1.5>*/ {
    /** Source code version */
    public static final String CVSID = "@(#) $Id: SchemaArray.java 523 2010-07-26 17:57:50Z gfis $";

    /** log4j logger (category) */
    private Logger log;

    /** newline character(s) */
    private String nl;

    // configuration properties settable from outside */
    /** whether to write debugging comments */
    private int debug;
    /** whether to sort choices (default 0 = no); enumerations and attributes are always sorted */
    private int sortChildren;
    /** whether to insert "unresolvedChoice" (0, default), or to choose first (1), last (9) choice */
    private int choiceResolution;
    /** SchemaArray element which gets the accumulated properties specified by schema elements */
    private SchemaBean anchBean;
    /** code for output format as defined in {@link SchemaBean} */
    private int mode;
    /** Defines whether only start tags should be shown */
    private int startTagsOnly;
    /** Defines whether comments (with types, restrictions, annotations) should be shown for some modes */
    private int withComments;
    /** Defines whether values should be generated for some modes */
    private int withValues;

    /** Maps simple|complexType names to the element node which defines them */
    private TreeMap/*<1.5*/<String, Node>/*1.5>*/ typeMap;
    /** Stack of nested elements for avoiding recursive (cyclic) tree walking */
    private PathStack pathStack;
    /** target namespace or null if not yet known or already output */
    private String targetNamespace;
    /** as long as first instance element in schema is not yet processed */
    private boolean firstElement;

    /** No-args Constructor
     */
    public SchemaArray() {
        super(4096);
        log = Logger.getLogger(SchemaArray.class.getName());
        nl = System.getProperty("line.separator");
        typeMap     = new TreeMap/*<1.5*/<String, Node>/*1.5>*/();
        pathStack   = new PathStack();
        targetNamespace = null;
        firstElement    = true;
        anchBean       = null;
        setDebug            (1);
        setSortChildren     (1);
        setChoiceResolution (0);
        setMode             (SchemaBean.MODE_PLAIN);
        setStartTagsOnly    (0);
        setWithComments     (0);
        setWithValues       (0);
    } // constructor

    /** Sets the debugging trace level
     *  @param level no debugging (0), some (1) or much (2) debugging trace information
     */
    public void setDebug(int level) {
        debug = level;
    } // setDebug

    /** Sets the way how children of choices are sorted.
     *  @param sort either do not sort (0) or sort (1) children of choices
     */
    public void setSortChildren(int sort) {
        sortChildren = sort;
    } // setSortChildren

    /** Sets the way how choices are resolved.
     *  @param resolution either insert "unresolvedChoice" (0, default)
     *  or take the first (1) or the last (9) child element.
     */
    public void setChoiceResolution(int resolution) {
        choiceResolution = resolution;
    } // setChoiceResolution

    /** Sets the "anchestor" bean which gets the accumulated properties specified by schema elements.
     *  This method is needed to set the anchestor for the root element.
     *  @param bean bean to be set
     */
    public void setanchBean(SchemaBean bean) {
        anchBean = bean;
    } // setanchBean

    /** Sets the output format
     *  @param format code for the output format, corresponding to the value of commandline option "-m"
     */
    public void setMode(int format) {
        mode = format;
    } // setMode

    /** Defines whether only start tags should be shown
     *  @param whether = 1 if only start tags should be shown
     */
    public void setStartTagsOnly(int whether) {
        startTagsOnly = whether;
    } // setStartTagsOnly

    /** Defines whether comments (with types, restrictions, annotations) should be shown for some modes
     *  @param whether = 1 if comments should be shown
     */
    public void setWithComments(int whether) {
        withComments = whether;
    } // setWithComments

    /** Defines whether values should be generated for some modes
     *  @param whether = 1 if values should be generated
     */
    public void setWithValues(int whether) {
        withValues = whether;
    } // setWithValues

    /** Runs through all top level nodes of the document and collects the types
     *  @param node (root) node to be traversed
     */
    public void collectTypes(Node node) {
        try {
            NodeList nodes = node.getChildNodes();
            int ichild = 0;
            while (ichild < nodes.getLength()) {
                Node child = nodes.item(ichild ++); // this is a complex or simple type
                if (child.getNodeType() == Node.ELEMENT_NODE) {
                    NamedNodeMap attrs = child.getAttributes();
                    Node name = attrs.getNamedItem("name");
                    if (name != null) {
                        if (debug >= 2) {
                            log.debug("collect type " + child.getNodeName() + "\t" + name.getNodeValue());
                        }
                        typeMap.put(name.getNodeValue(), child); //
                    }
                } // if element
            } // while ichild
            if (debug >= 2) {
                log.debug("collection done");
            }
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // collectTypes

    /** Evaluates the cardinality attributes <em>minOccurs</em> and <em>maxOccurs</em>
     *  @param arrayIndex position of the list element to be described
     *  @param node node which has the cardinality attributes
     */
    public void evalCardinality(int arrayIndex, Node node) {
        try {
            SchemaBean bean = (SchemaBean) get(arrayIndex); // the element of the list to be described
            NamedNodeMap attrs = node.getAttributes();
            Node minNode = attrs.getNamedItem("minOccurs");
            int min = 1; // default if not present
            if (minNode != null) {
                String minStr = minNode.getNodeValue();
                if (minStr.equals("unbounded")) {
                    min = SchemaBean.UNBOUNDED;
                } else {
                    try {
                        min = Integer.parseInt(minStr);
                    } catch (Exception exc) {
                    }
                }
            } // minOccurs was present
            bean.setMinOccurs(min);

            Node maxNode = attrs.getNamedItem("maxOccurs");
            int max = 1; // default if not present
            if (maxNode != null) {
                String maxStr = maxNode.getNodeValue();
                if (maxStr.equals("unbounded")) {
                    max = SchemaBean.UNBOUNDED;
                } else {
                    try {
                        max = Integer.parseInt(maxStr);
                    } catch (Exception exc) {
                    }
                }
            } // maxOccurs was present
            bean.setMaxOccurs(max);
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // evalCardinality

    /** Evaluates the "use=" attribute of attribute nodes
     *  @param arrayIndex position of the list element to be described
     *  @param node node which has the "use=" attribute
     */
    public void evalUse(int arrayIndex, Node node) {
        try {
            SchemaBean bean = (SchemaBean) get(arrayIndex); // the element of the list to be described
            NamedNodeMap attrs = node.getAttributes();
            Node useNode = attrs.getNamedItem("use");
            String value = "1"; // default for "required"; what is "prohibited" ??
            if (useNode != null) {
                String useStr = useNode.getNodeValue();
                if (false) {
                } else if (useStr.equals("optional")) {
                    bean.setMinOccurs(0);
                } else if (useStr.equals("prohibited")) {
                    bean.setMinOccurs(0);
                    bean.setMaxOccurs(0);
                }
            } // "use" was present
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // evalUse

    /** Inserts the element children of a node in their order at a specified index
     *  @param arrayIndex index where to insert in the list
     *  @param children children which should be inserted
     */
    public void insertChildren(int arrayIndex, NodeList children) {
        try {
            SchemaBean mother  = (SchemaBean) get(arrayIndex);
			if (debug >= 2) {
				log.debug("insertChildren[" + arrayIndex + "]: " + mother.getNodeName());
			}
            int ichild = 0;
            while (ichild < children.getLength()) {
                Node childNode = children.item(ichild ++);
                if (childNode.getNodeType() == Node.ELEMENT_NODE) {
                    SchemaBean child = new SchemaBean(childNode, mother);
                    this.add(++ arrayIndex, child);
                }
                // else ignore text, comment, whitespace nodes
            } // while ichild
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // insertChildren

    /** Inserts the first element child of a node at a specified index
     *  @param arrayIndex index where to insert in the list
     *  @param children list of all children
     *  @param all whether to insert all element children, or only the first
     */
    public void insertChildren(int arrayIndex, NodeList children, boolean all) {
        try {
            SchemaBean mother  = (SchemaBean) get(arrayIndex);
            int ichild = 0;
            boolean busy = true;
            while (busy && ichild < children.getLength()) {
                Node childNode = children.item(ichild ++);
                if (childNode.getNodeType() == Node.ELEMENT_NODE) {
                    SchemaBean child = new SchemaBean(childNode, mother);
                    this.add(++ arrayIndex, child);
                    if (! all) {
                        busy = false;
                    }
                }
                // else ignore text, comment, whitespace nodes
            } // while ichild
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // insertChildren

    /** Inserts the children of a node in sorted order directly behind the current node
     *  @param arrayIndex index of the current element in the list
     *  @param children of the node corresponding to the list element
     *  @param element local name of the elements which are expected for the sort - if there is none,
     *  the element order remains unchanged
     *  @param key attribute whose value is used as sort key
     */
    public void insertSortedChildren(int arrayIndex, NodeList children, String element, String key) {
        // sorting not yet implemented
        insertChildren(arrayIndex, children);
    } // insertSortedChildren

    /** Expands a type definition for a specified list element,
     *  and the normal children, and avoid recursion in both cases
     *  @param arrayIndex position of the list element to be described
     *  @param children node list of children of the current node
     *  @param typeAttr an attribute node containing the reference to a complex or simple type
     */
    public void expandChildrenAndType(int arrayIndex, NodeList children, Node typeAttr) {
        try {
            SchemaBean bean = (SchemaBean) get(arrayIndex); // the element of the list to be processed
            Node node = bean.getNode();
            { // first expand children
                insertChildren(arrayIndex, children);
            } // expand children

            if (typeAttr != null) { // then try to expand the type
                String typeName = typeAttr.getNodeValue(); // the type's name
				if (debug >= 2) {
					log.debug("expandChildrenAndType[" + arrayIndex + "]: " + typeName);
				}
                bean.setBaseType(typeName);
                // remove prefix in any case
                int colonPos = typeName.indexOf(':');
                String localType = "";
                String typePrefix = "";
                if (colonPos >= 0) {
                	localType = typeName.substring(colonPos + 1);
                	typePrefix = typeName.substring(0, colonPos);
                } else {
                	localType = typeName;
                }
                Object obj = typeMap.get(localType);
                if (obj != null) { // was stored by collectTypes
                    Node typeNode = (Node) obj;
                    insertChildren(arrayIndex, typeNode.getChildNodes());
                } else { // was not collected 
	                String elemPrefix = node.getPrefix();
	                log.debug("compare " + elemPrefix + " <> " + typePrefix);
    	            if (elemPrefix == null) { 
        	        	elemPrefix = "";
            	    }
                	if (typePrefix.equals(elemPrefix)) { // in the W3C Schema Namespace
                		bean.setDataType(localType);
                	} // W3C type
                } // not collected
            } // expand type
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // expandChildrenAndType

    /** Copyies a list entry and inserts the copy directly behind
     *  the original, but as end tag
     *  @param bean which should be cloned
     *  @param arrayIndex insert the twin behind this position in the list
     */
    public void insertTwin(SchemaBean bean, int arrayIndex) {
        try {
            SchemaBean twin = new SchemaBean(bean.getNode(), bean);
            twin.setNodeName    (bean.getNodeName());
            twin.setStartEnd    (SchemaBean.END_TAG);
            twin.setDisplayMode (bean.getDisplayMode());
            twin.setLevel       (bean.getLevel());
            this.add(++ arrayIndex, twin);
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // insertChildren

    /** Iterates over a list of nodes, expands all children and stores
     *  a linear list of {@link SchemaBean SchemaBeans} which are generated from the
     *	visited nodes. For attributes and elements, some properties are
     *	stored directly in the bean, whereas for most other schema language elements,
     *	the properties are stored in the "anchor element" for which they are defined.
     *	<p>
     *	The children of a node are stored directly behind the mother node.
     *	For element nodes, a "twin" for the end tag is first inserted behind the start tag.
     *	It is assumed that the first element definition in the schema is the root element
     *	in the resulting XML instance. All other children of the main "schema" node 
     *	should be type definitions and are not (directly) walked into.
     *  @param arrayIndex index of the {@link SchemaBean} to be expanded
     */
    public void expand(int arrayIndex) {
        String tag = null; // schema, element, attribute, choice etc.
        Node targetAttr = null; // node of the targetNamespace="" attribute of the <schema> element
        PathElement topElement = null; // leads to the top bean on the stack
        while (arrayIndex < size()) {
            try {
                SchemaBean bean = (SchemaBean) get(arrayIndex); // the element of the list to be processed
                anchBean = (SchemaBean) this.get(bean.getAnchIndex());
                Node node = bean.getNode();
                tag = node.getLocalName();

                if (false) {
                } else if (bean.getStartEnd() == SchemaBean.START_TAG) {
                    NodeList children = (node != null) ? node.getChildNodes() : null;
                    NamedNodeMap attrs = node.getAttributes();
			        Node nameAttr = attrs.getNamedItem("name");
                    Node  refAttr = attrs.getNamedItem("ref" );
                    Node typeAttr = attrs.getNamedItem("type");
                    String elemName = nameAttr == null 
                    		? (refAttr == null ? "<noref>" : refAttr.getNodeValue())
                    		: nameAttr.getNodeValue();
                    if (debug >= 2) {
                        log.debug("START node[" + arrayIndex + "]"
                                + ", level " + bean.getLevel() + ": " + pathStack.size() + ": "
                                + node.getNodeName() + "\t" + elemName
                                );
                    }

                    // below all relevant elements are tested
                    if (false) {
                    } else if (tag.equals("annotation"   )
                            || tag.equals("complexType"  )
                            || tag.equals("all"          ) // similiar to "sequence"
                            || tag.equals("sequence"     )
                            || tag.equals("simpleContent")
                            || tag.equals("simpleType"   )
                            ) { // simply walk into subtree
                        insertChildren(arrayIndex, children);

                    } else if (false
                            || tag.equals("fractionDigits")
                            || tag.equals("minExclusive")
                            || tag.equals("maxExclusive")
                            || tag.equals("minInclusive")
                            || tag.equals("maxInclusive")
                            || tag.equals("minLength"   )
                            || tag.equals("maxLength"   )
                            || tag.equals("pattern"     )
                            || tag.equals("totalDigits" )
                            ) { // store the restriction in the anchestor element
                        Node value = attrs.getNamedItem("value");
                        if (value != null) {
                            anchBean.putRestriction(tag, value.getNodeValue());
                        }

                    } else if (tag.equals("appinfo"      )
                            || tag.equals("documentation")
                            ) { // store the text content in the anchestor element
                        anchBean.putRestriction(tag, node.getTextContent().replaceAll("\\r?\\n", " "));

                    } else if (tag.equals("restriction" )) {
                        Node baseAttr = attrs.getNamedItem("base");
                        if (baseAttr != null) {
                            anchBean.setDataType(baseAttr.getNodeValue().replaceAll("xs:",""));
                        }
                        insertChildren(arrayIndex, children);

                    } else if (tag.equals("schema"      )) {
                        targetAttr = attrs.getNamedItem("targetNamespace");
						if (targetAttr != null) {
                        	targetNamespace = targetAttr.getNodeValue();
                        }
                        insertChildren(arrayIndex, children);

                    } else if (tag.equals("attribute"    ) && nameAttr != null) {
                        bean.setDisplayMode(SchemaBean.DISPLAY_ATTRIBUTE);
                        bean.setXPath(anchBean.getXPath() 
                        		+ SchemaBean.XPATH_SEPARATOR + "@" 
                        		+ nameAttr.getNodeValue());
                        anchBean.putAttribute(nameAttr.getNodeValue(), bean);
                        anchBean = bean;
                        bean.setAnchIndex(arrayIndex); // set children's facets for this bean
                        evalUse(arrayIndex, node);
                        typeAttr = attrs.getNamedItem("type");
                        expandChildrenAndType(arrayIndex, children, typeAttr);

                    } else if (tag.equals("choice"      )) {
                        evalCardinality(arrayIndex, node);
                        switch(choiceResolution) {
                            default:
                            case 9: // last - not yet implemented
                            case 0: // let unresolved
                                bean.setDisplayMode(SchemaBean.DISPLAY_ELEMENT);
                                bean.setNodeName("__unresolvedChoice__");
                                // bean.setMaxOccurs(0); // indicates that no restrictions should be shown
                                insertTwin(bean, arrayIndex);
                                insertSortedChildren(arrayIndex, children, "element", "name"); // all
                                break;
                            case 1: // only the first
                                if (withComments == 0) {
                                    bean.setDisplayMode(SchemaBean.DISPLAY_NONE);
                                    insertChildren(arrayIndex, children, false); // not all, only the first
                                } else { // insert indication that first was taken
                                    bean.setDisplayMode(SchemaBean.DISPLAY_COMMENT);
                                    bean.setNodeName("firstChoiceAlternative");
                                    insertTwin(bean, arrayIndex);
                                    insertChildren(arrayIndex, children, false); // not all, only the first
                                }
                                break;
                        } // switch choiceResolution

                    } else if (tag.equals("element"      )) { //  && nameAttr != null) {
                        bean.setDisplayMode(SchemaBean.DISPLAY_ELEMENT);
                        if (firstElement) { // truncate
                            // truncate array after first element -
                            // those are the (complexType) children of the schema itself
                            firstElement = false;

                            removeRange(arrayIndex + 1, size()); // 2nd "+1" because twin was already inserted
                            if (targetNamespace != null) { // insert an attribute for the target namespace
                                SchemaBean targetBean = new SchemaBean();
                                targetBean.setDataType("string");
                                targetBean.setBaseType(targetNamespace);
                                targetBean.putRestriction("minLength", "1");
                                targetBean.putRestriction("maxLength", "2906"); // very high
                                // targetAttr.getNodeValue()
                                bean.putAttribute("xmlns", targetBean);
                            } // with target namespace
                        /*
                        */
                        } // if truncate
                        if ( refAttr != null) { // <xs:element ref="elemName">
							String refName = refAttr.getNodeValue();
			                Object refObj = typeMap.get(refName);
			                if (refObj != null) { // was stored by collectTypes
			                    node = (Node) refObj;
                    			children = (node != null) ? node.getChildNodes() : null;
                    			attrs = node.getAttributes();
			        			nameAttr = attrs.getNamedItem("name");
                    			refAttr = attrs.getNamedItem("ref" );
                    			typeAttr = attrs.getNamedItem("type");
                    			elemName = nameAttr == null 
                    					? (refAttr == null ? "<noref>" : refAttr.getNodeValue())
                    					: nameAttr.getNodeValue();
	                        	bean.setXPath(anchBean.getXPath() + SchemaBean.XPATH_SEPARATOR + elemName);
    	                    	anchBean = bean;
        	                	bean.setAnchIndex(arrayIndex); // set children's facets for this bean
			                } // was collected 
                        }
                        insertTwin(bean, arrayIndex);
                        evalCardinality(arrayIndex, node);
                        String typeName = "";
                        if (typeAttr != null) {
                            typeName = typeAttr.getNodeValue();
                        	bean.setXPath(anchBean.getXPath() + SchemaBean.XPATH_SEPARATOR + elemName);
                        	anchBean = bean;
                        	bean.setAnchIndex(arrayIndex); // set children's facets for this bean
                        }
                        topElement = new PathElement(typeName, elemName, arrayIndex);
                        if (debug >= 2) {
                        	log.debug("search[" + arrayIndex + "]: " + typeName + " / " + elemName);
                        }
                        if (pathStack.search(topElement) <= 0) { // did not find same type and name on the stack
                            // element not yet found on stack
                            pathStack.push(topElement);
                            // bean.setXPath(pathStack.toString(SchemaBean.XPATH_SEPARATOR, 2));
                            expandChildrenAndType(arrayIndex, children, typeAttr);
                        } else { // found same type and name: cyclic activation detected
                            log.error("recursion detected in " + elemName + ":" + typeName);
                            pathStack.push(topElement); // such that it can be popped below
                            // but do not expand children
                        } // found cyclic

                    } else if (tag.equals("enumeration" )) {
                        Node valueNode = attrs.getNamedItem("value");
                        if (valueNode != null) {
                            TreeSet/*<1.5*/<String>/*1.5>*/ sortedEnums = anchBean.getEnumerationSet();
                            sortedEnums.add((String) valueNode.getNodeValue());
                            anchBean.putRestriction(SchemaBean.ENUMERATION_KEY, sortedEnums);
                        } // value attribute was present

                    } else if (tag.equals("extension"   )) {
                        expandChildrenAndType(arrayIndex, children, attrs.getNamedItem("base"));

                //  } else if (tag.equals("all"          )) {
                //  } else if (tag.equals("any"          )) {
                //  } else if (tag.equals("anyAttribute" )) {
                //  } else if (tag.equals("attributeGroup")) {
                //  } else if (tag.equals("field"       )) {
                //  } else if (tag.equals("group"       )) {
                //  } else if (tag.equals("import"      )) {
                //  } else if (tag.equals("include"     )) {
                //  } else if (tag.equals("key"         )) {
                //  } else if (tag.equals("keyref"      )) {
                //  } else if (tag.equals("length"      )) {
                //  } else if (tag.equals("list"        )) {
                //  } else if (tag.equals("notation"    )) {
                //  } else if (tag.equals("redefine"    )) {
                //  } else if (tag.equals("selector"    )) {
                //  } else if (tag.equals("union"       )) {
                //  } else if (tag.equals("unique"      )) {
                //  } else if (tag.equals("whiteSpace"  )) {
                    } else {
                        // do not walk into any other node
                //      log.error("unknown node name " + tag);
                    }

                } else if (bean.getStartEnd() == SchemaBean.END_TAG) {
                    if (false) {
                    } else if (tag.equals("schema"      )) {
                        arrayIndex = this.size(); // break expansion loop, truncate al nodes resulting from types

                    } else if (tag.equals("element"     )) {
                        if (! pathStack.empty()) {
                            pathStack.pop();
                        } else {
                            // log.error("Stack underflow in END_TAG");
                        }
                    } else if (tag.equals("restriction" )) {
                    }
                    if (debug >= 2) {
                        log.debug("END   node[" + arrayIndex + "]"
                                + ", level " + bean.getLevel() + ": " // pathStack.size() + ": "
                                + node.getNodeName() + "\t"
                                + bean.getNodeName()
                                );
                    }
                } // END_TAG
            } catch (Exception exc) {
                log.error(exc.getMessage(), exc);
            }
            arrayIndex ++;
        } // while arrayIndex
    } // expand

    /** Loads the schema source file. 
     *	The source file encoding must have been set previously.
     *  @param stream input stream for the W3C schema file
     *	@param sourceEncoding encoding of the source schema file
     */
    public void loadSchema(InputStream stream, String sourceEncoding) {
        Document document = null;
        try {
        	InputSource source = new InputSource();
        	source.setByteStream(stream);
        	source.setEncoding(sourceEncoding);
            // String   uri = "file:" + new File(xmlFileName).getAbsolutePath();
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            factory.setNamespaceAware(true);
            factory.setValidating(false);
            factory.setAttribute
             		( "http://java.sun.com/xml/jaxp/properties/schemaLanguage"
                    , "http://www.w3.org/2001/XMLSchema");
            // factory.setAttribute("http://java.sun.com/xml/jaxp/properties/schemaSource", new File(xsdFileName)); 
            DocumentBuilder builder = factory.newDocumentBuilder();             
            // builder.setErrorHandler(new ValidityErrorHandler());
            document = builder.parse(source);

            Node rootNode = document.getDocumentElement();
            collectTypes(rootNode);
            SchemaBean root = new SchemaBean();
            root.setNode(rootNode);
            root.setLevel(0);
            root.setXPath("");
            add(root);
            setanchBean(root); // just for safety, we hope for an initial element bean in the schema

            expand(0);
        } catch (Exception exc) {
            log.error(exc.toString(), exc);
        }
    } // loadSchema

    /** Iterates through the list, and sets DISPLAY_SIMPLE in any start tag that has
     *  an immediately following end tag. The latter gets DISPLAY_NONE.
     */
    public void simplify() {
        try {
            int arrayIndex = 0;
            SchemaBean bean1 = (SchemaBean) this.get(arrayIndex);
            while (arrayIndex < this.size()) {
                SchemaBean bean2 = (SchemaBean) this.get(arrayIndex);
                switch(bean2.getDisplayMode()) {
                    default:
                    case SchemaBean.DISPLAY_NONE:
                    case SchemaBean.DISPLAY_ATTRIBUTE:
                    case SchemaBean.DISPLAY_COMMENT:
                        break;
                    case SchemaBean.DISPLAY_ELEMENT:
                        if (bean2.getStartEnd() == SchemaBean.END_TAG) {
                            if (startTagsOnly > 0) {
                                bean2.setDisplayMode(SchemaBean.DISPLAY_NONE);
                            } else if ( bean1.getStartEnd() == SchemaBean.START_TAG
                                    &&  bean1.getLevel()    == bean2.getLevel()
                                    &&  bean1.getNodeName().equals(bean2.getNodeName())
                                    ) {
                                bean1.setDisplayMode(SchemaBean.DISPLAY_SIMPLE);
                                bean2.setDisplayMode(SchemaBean.DISPLAY_NONE);
                            }
                        } // END_TAG
                        bean1 = bean2;
                        break;
                } // switch DisplayMode
                arrayIndex ++;
            } // while arrayIndex
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // simplify

    //-----------------------
    // representation methods
    //-----------------------

    /** Gets the current time 
     *	@return time in ISO timestamp format
     */
    private String getCurrentTime() {
        return (new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")).format(new java.util.Date());
    } // getCurrentTime

    /** Get the representation of an output file header.
     *  The loop for lines starts with a newline.
     *  @param fileName name of the input schema file
     *  @param encoding encoding of the input schema
     *  @return a string representing the header
     */
    private String toHeaderString(String fileName, String encoding) {
        StringBuffer result = new StringBuffer(512);
        String lt = SchemaBean.lt(mode);
        String gt = SchemaBean.gt(mode);
        String xmlPI = lt + "?xml version=\"1.0\" encoding=\"" + encoding + "\"?" + gt;

        switch (mode) {
            case SchemaBean.MODE_HTML:
                result.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\""
                    + nl +  "\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">"
                    + nl +  "<html xmlns=\"http://www.w3.org/1999/xhtml\">"
                    + nl +  "<head>"
                    + nl +  "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=\""
                                + encoding.toLowerCase() + "\" />"
                    + nl +  "<title>Schema List</title>"
                    + nl +  "<style>"
                    + nl +  ".mono { font-family:Courier; }"
                    + nl +  ".bold { font-family:Courier;font-weight:bold; }"
                    + nl +  ".doct { background-color:gainsboro }"
                    + nl +  ".valu { font-family:Courier;font-weight:bold;color:green; }"
                    + nl +  "body,p,h1,h2,h3,h4,dl,dd,dt,ul,ol,li,div,td,th,address,blockquote,nobr,b,i,a,br,img"
                    + nl +  "      { font-family:Verdana,Arial,sans-serif;background-color:lemonchiffon }"
                    + nl +  "</style>"
            //      + nl +  "<link rel=\"stylesheet\" type=\"text/css\" href=\"stylesheet.css\" />"
                    + nl +  "</head>"
                    + nl +  "<body>"
                    );
                result.append(SchemaBean.emphasize(mode, "mono", xmlPI));
                result.append("<br />" + nl + SchemaBean.ltComt(mode));
                result.append(" generated by xtool/SchemaArray (c) 2007 punctum.com at " + getCurrentTime());
                // result.append(" (äöüÄÖÜß)");
                result.append(nl + "<h2>");
                result.append(fileName);
                result.append("</h2>" + nl);
                result.append(SchemaBean.gtComt(mode) + "<br />" + nl);
                break;
            case SchemaBean.MODE_TSV:
				// Excel 2003 and higher tries to process XML if there is an XML declaration
                break;
            case SchemaBean.MODE_PLAIN:
            case SchemaBean.MODE_XML:
                result.append(xmlPI);
                break;
            default:
                break;
        } // switch mode
        return result.toString();
    } // toHeaderString

    /** Get the representation of an output file trailer.
     *  The loop for lines did not end with a newline.
     *  @return a string representing the trailer
     */
    private String toTrailerString() {
        StringBuffer result = new StringBuffer(32);
        result.append(nl);
        switch (mode) {
            case SchemaBean.MODE_HTML:
                result.append(nl);
                result.append("</body></html>");
                break;
            case SchemaBean.MODE_PLAIN:
            case SchemaBean.MODE_TSV:
            case SchemaBean.MODE_XML:
            default:
                break;
        } // switch mode
        return result.toString();
    } // toTrailerString

    /** Print stream for the result table */
    private PrintStream out;

    /** Sets the print stream for the output.
     *  @param out stream where to write to
     *  @param encoding encoding of the output file
     */
    public void setPrintStream(OutputStream out, String encoding) {
        try {
            this.out = new PrintStream(out, false, encoding); // no auto-flsuh
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // setPrintStream

    /** Writes the external representation of this list.
     *  Each line starts with a newline.
     *  End tags are written on the same line as their corresponding start tag
     *  if the element has no (elment or attribute) children.
     *  For each attribute child, an indented comment line is written below the element's start tag.
     *  @param fileName name of the input W3C schema file
     *  @param encoding encoding of the input schema
     */
    public void print(String fileName, String encoding) {
        StringBuffer result = new StringBuffer(256);
        try {
            String sep; // most common separator
            String seps[]; // array for separators between the individual fields
            if (mode != SchemaBean.MODE_TSV) {
                sep = " ";
                //                   0                       1    2    3    4    5
                seps = new String[] {SchemaBean.ltComt(mode), sep, sep, sep, sep, SchemaBean.gtComt(mode)};
            } else {
                sep = "\t";
                //                   0                       1    2    3    4    5    6
                seps = new String[] {sep                   , sep, sep, sep, sep, sep, sep + ";"};
            }
            out.print(toHeaderString(fileName, encoding));
            int arrayIndex = 0;
            SchemaBean previousElement = (SchemaBean) this.get(arrayIndex);

            while (arrayIndex < this.size()) {
                SchemaBean bean = (SchemaBean) this.get(arrayIndex);
                int displayMode = bean.getDisplayMode();
                switch (displayMode) {
                    default:
                    case SchemaBean.DISPLAY_NONE:
                        break;
                    case SchemaBean.DISPLAY_COMMENT:
                        result.append(nl);
                        result.append(bean.toLevelString             (mode));
                        if (bean.getStartEnd() == SchemaBean.START_TAG) {
                            result.append(bean.toStartElementString  (mode));
                        } else { // END_TAG
                            result.append(bean.toEndElementString    (mode));
                        }
                        if (mode == SchemaBean.MODE_HTML) {
                            result.append("<br />");
                        } // html
                        break;
                    case SchemaBean.DISPLAY_ATTRIBUTE: // attributes have no twin
                    case SchemaBean.DISPLAY_SIMPLE:
                    case SchemaBean.DISPLAY_ELEMENT:
                        if (displayMode != SchemaBean.DISPLAY_ATTRIBUTE || withComments > 0) {
                            // not a suppressible comment
                            result.append(nl);
                            result.append(bean.toLevelString             (mode));
                            if (bean.getStartEnd() == SchemaBean.START_TAG) {
                                result.append(bean.toStartElementString  (mode));
                                if (withValues > 0 && displayMode != SchemaBean.DISPLAY_ATTRIBUTE) {
                                    result.append(SchemaBean.emphasize(mode, "valu", bean.toValueString()));
                                }
                                if (startTagsOnly == 0 && displayMode == SchemaBean.DISPLAY_SIMPLE) {
                                    result.append(bean.toEndElementString    (mode));
                                }
                                if (withComments > 0) { // && bean.getMaxOccurs() > 0) {
	                                result.append(seps[0]);
    	                            result.append(bean.toMultiplicityString  (mode));
                                    result.append(seps[1]);
                                    result.append(bean.toBaseTypeString      (mode));
                                    result.append(seps[2]);
                                    result.append(bean.toDataTypeString      (mode));
                                    result.append(seps[3]);
                                    result.append(bean.toRestrictionsString  (mode));
                                    result.append(seps[4]);
                                    result.append(bean.toDocumentationString (mode));
                                    result.append(seps[5]);
                                    if (mode == SchemaBean.MODE_TSV) {
                                        result.append(bean.toXPathString     (mode));
                                        result.append(seps[6]);
                                    }
                                } // if withComments // maxOccurs > 0
                            } else if (startTagsOnly == 0) { // END_TAG
                                result.append(bean.toEndElementString    (mode));
                            }
                        if (mode == SchemaBean.MODE_HTML) {
                                result.append("<br />");
                            } // html
                        } // no suppressible comment
                        break;
                } // switch displayMode
                if (result.length() > 0) {
                    out.print(result.toString());
                    result.setLength(0);
                }
                arrayIndex ++;
            } // while arrayIndex
            out.print(nl);
            out.print(toTrailerString());
            out.print(nl);
            out.close();
        } catch (Exception exc) {
            log.error(exc.getMessage(), exc);
        }
    } // print

} // class SchemaArray

/*  PathElement.java - one entry in the stack of elements
 *  @(#) $Id: PathElement.java 40 2008-09-08 06:41:22Z gfis $
 *  2007-11-28, Georg Fischer: compareTo, constructor etc.
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

/** One entry in the stack of elements
 *  @author Dr. Georg Fischer
 */
public class PathElement {
    /** Source code version */
    public static final String CVSID = "@(#) $Id: PathElement.java 40 2008-09-08 06:41:22Z gfis $";

    /** No-args Constructor
     */
    public PathElement() {
    } // no-args constructor

    /** Constructor which creates the bean from parameters.
     *  @param typeName name of the type associated with the element
     *  @param name name of the element
     *  @param combIndex index of the element's tooth in the comb
     */
    public PathElement(String typeName, String name, int combIndex) {
        this();
        this.typeName 	= typeName;
        this.name 		= name;
        this.combIndex	= combIndex;
    } // constructor with parameters

    //---------------------------
    // property access
    //---------------------------

    /** name of the type associated with the entry */
    protected String typeName;

    /** Sets the type name
     *  @param typeName name of the type associated with the entry
     */
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    } // setTypeName

    /** Gets the type name
     *  @return name of the type associated with the entry
     */
    public String getTypeName() {
        return typeName;
    } // getTypeName

    //----------------
    /** name of the element to be checked */
    protected String name;

    /** Sets the name
     *  @param name name of the element to be checked
     */
    public void setName(String name) {
        this.name = name;
    } // setName

    /** Gets the name
     *  @return name of the element to be checked
     */
    public String getName() {
        return name;
    } // getName

    //----------------
    /** index of the element's tooth in the comb */
    protected int combIndex;

    /** Sets the combIndex
     *  @param combIndex index of the element's tooth in the comb
     */
    public void setCombIndex(int combIndex) {
        this.combIndex = combIndex;
    } // setCombIndex

    /** Gets the combIndex
     *  @return index of the element's tooth in the comb
     */
    public int getCombIndex() {
        return combIndex;
    } // getCombIndex

    //----------------
    // utility methods
    //----------------

    /** Compares this bean - its type and name - with another one.
     *  @param bean2 right comparision operand
     *  @return true if the two beans are determined to be equivalent
     */
    public boolean equals(PathElement bean2) {
        boolean result = this.typeName.equals(bean2.getTypeName())
                &&       this.    name.equals(bean2.    getName());
        return result;
    } // equals

} // class PathElement

/*  for reading ZIP files in a servlet
 *  @(#) $Id: NonClosingInputStream.java 439 2010-06-01 09:59:59Z gfis $
 *  2017-05-28: javadoc 1.8
 *  2007-11-09: Georg Fischer
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
import  java.io.FilterInputStream;
import  java.io.InputStream;

/** Shields the close() method in order to read ZIP files in a servlet
 *  @author Dr. Georg Fischer
 */
public class NonClosingInputStream extends FilterInputStream {

    /** Empty Constructor
     *  @param in base input stream
     */
    public NonClosingInputStream (InputStream in) {
        super(in);
    } // Constructor

    /** close() implementation which does nothing
     */
    public void close() {
    } // close

} // NonClosingInputStream


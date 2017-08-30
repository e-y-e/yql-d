/**
 * License:   $(LINK2 boost.org/LICENSE_1_0.txt, Boost License 1.0)
 * Copyright: Copyright © 2017, Lewis Revill
 * Authors:   Lewis Revill
 */
module yql.internal;


/// Scherkl-Nielsen self-important lookup idiom.
package template from(string name)
{
    mixin("import from = " ~ name ~ ";");
}

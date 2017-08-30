/**
 * Generic utilities used in the implementation of yql-d.
 *
 * $(TABLE
 *     $(TR $(TD $(B Function Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #isIdentifier, isIdentifier))
 *          $(TD Determines whether a string represents an identifier))
 *     $(TR $(TD $(LINK2 #isYQLIdentifier, isYQLIdentifier))
 *          $(TD Determines whether a string represents a YQL identifier))
 *     $(TR $(TD $(LINK2 #isNumber, isNumber))
 *          $(TD Determines whether a string represents a number))
 *     $(TR $(TD $(LINK2 #isQuotedString, isQuotedString))
 *          $(TD Determines whether a string represents a quoted string))
 * )
 *
 * License:   $(LINK2 boost.org/LICENSE_1_0.txt, Boost License 1.0)
 * Copyright: Copyright © 2017, Lewis Revill
 * Authors:   Lewis Revill
 */
module yql.util;

import yql.internal : from;


/**
 * Determines whether s represents an identifier.
 *
 * An identifier consists of an alphabetic character or an underscore followed
 * by 0 or more alphanumeric characters or underscores.
 *
 * Params:
 *     S = (template parameter) type of the given string or range of characters
 *     s = the string or range of characters representing the identifier
 */
bool isIdentifier(S)(S s)
    if (from!"std.traits".isNarrowString!S ||
        (from!"std.range".isInputRange!S &&
         from!"std.traits".isSomeChar!(from!"std.range".ElementType!S) &&
        !from!"std.range".isInfinite!S))
{
    import std.traits : isNarrowString;
    import std.range.primitives : empty, front, popFront;
    import std.ascii : isAlpha, isAlphaNum;
    import std.algorithm.searching : all;

    static if (isNarrowString!S)
    {
        import std.utf : byCodeUnit;

        auto codeUnits = s.byCodeUnit;
    }
    else
    {
        alias codeUnits = s;
    }

    if (codeUnits.empty) return false;
    immutable f = codeUnits.front;
    if (!(f.isAlpha || f == '_')) return false;
    codeUnits.popFront;

    return codeUnits.all!(c => c.isAlphaNum || c == '_');
}

///
@safe @nogc pure nothrow
unittest
{
    assert(isIdentifier("name"));

    // Identifiers can start with a capital.
    assert(isIdentifier("Name"));

    // Or an underscore.
    assert(isIdentifier("_name"));

    // Any other character can also be a capital.
    assert(isIdentifier("NAME"));

    // Or an underscore.
    assert(isIdentifier("name_"));

    // Or a digit.
    assert(isIdentifier("name1"));

    // Identifiers cannot start with a digit.
    assert(!isIdentifier("0name"));

    // Any other characters are not permitted anywhere.
    assert(!isIdentifier("name!"));
}


/**
 * Determines whether s represents a YQL identifier.

 * A YQL identifier consists of 1 or more period-separated
 * $(LINK2 #isIdentifier, identifiers).
 *
 * Params:
 *     S = (template parameter) type of the given string or range of characters
 *     s = the string or range of characters representing the YQL identifier
 */
bool isYQLIdentifier(S)(S s)
    if (from!"std.traits".isNarrowString!S ||
        (from!"std.range".isInputRange!S &&
         from!"std.traits".isSomeChar!(from!"std.range".ElementType!S) &&
        !from!"std.range".isInfinite!S))
{
    import std.traits : isNarrowString;
    import std.algorithm.iteration : splitter;
    import std.algorithm.searching : all;

    static if (isNarrowString!S)
    {
        import std.utf : byCodeUnit;

        auto codeUnits = s.byCodeUnit;
    }
    else
    {
        alias codeUnits = s;
    }

    return codeUnits.splitter('.').all!(i => i.isIdentifier);
}

///
@safe @nogc pure nothrow
unittest
{
    // A YQL Identifier can be any valid identifier.
    assert(isIdentifier("name"));
    assert(isYQLIdentifier("name"));

    // In addition a period can be used as a separator.
    assert(isYQLIdentifier("yql.name"));

    // But it must be used as a separator.
    assert(!isYQLIdentifier("name."));

    // Each separated sequence must be a valid identifier.
    assert(!isYQLIdentifier("yql.0name"));
}


/**
 * Determines whether s represents a number.
 *
 * A number can be represented as 1 or more digits, which may be followed by a
 * decimal point with 1 or more additional digits.
 *
 * Params:
 *     S = (template parameter) type of the given string or range of characters
 *     s = the string or range of characters representing the number
 */
bool isNumber(S)(S s)
    if (from!"std.traits".isNarrowString!S ||
        (from!"std.range".isInputRange!S &&
         from!"std.traits".isSomeChar!(from!"std.range".ElementType!S) &&
        !from!"std.range".isInfinite!S))
{
    import std.traits : isNarrowString;
    import std.range.primitives : empty, front, popFront;
    import std.ascii : isDigit;

    static if (isNarrowString!S)
    {
        import std.utf : byCodeUnit;

        auto codeUnits = s.byCodeUnit;
    }
    else
    {
        alias codeUnits = s;
    }

    if (codeUnits.empty) return false;
    if (codeUnits.front == '-') codeUnits.popFront;

    bool sawDecimal = false;
    bool sawDigits = false;

    for (;;)
    {
        if (codeUnits.empty) break;
        immutable c = codeUnits.front;

        if (c.isDigit)
        {
            sawDigits = true;
            codeUnits.popFront;
            continue;
        }

        if (c == '.')
        {
            if (!sawDigits || sawDecimal) return false;

            sawDecimal = true;
            sawDigits = false;
            codeUnits.popFront;
            continue;
        }

        return false;
    }

    return sawDigits;
}

///
@safe @nogc pure nothrow
unittest
{
    assert(isNumber("100"));

    // A number can start with a minus sign.
    assert(isNumber("-100"));

    // A decimal point can occur in the middle of the number.
    assert(isNumber("1.00"));

    // A number cannot end with a decimal point.
    assert(!isNumber("100."));

    // Or start with one.
    assert(!isNumber(".1"));

    // Only one decimal point is allowed.
    assert(!isNumber("1.00.1"));

    // No other non-digits can occur in a number.
    assert(!isNumber("10a"));

    // Additional numeric seperators are not allowed.
    assert(!isNumber("1,000"));
}


/**
 * Determines whether s represents a quoted string.
 *
 * A string can be represented as any set of characters enclosed within single
 * or double quotes.
 *
 * Params:
 *     S = (template parameter) type of the given string or range of characters
 *     s = the string or range of characters representing the quoted string
 */
bool isQuotedString(S)(S s)
    if (from!"std.traits".isNarrowString!S ||
        (from!"std.range".isInputRange!S &&
         from!"std.traits".isSomeChar!(from!"std.range".ElementType!S) &&
        !from!"std.range".isInfinite!S))
{
    import std.traits : isNarrowString;
    import std.range.primitives : empty, front, popFront, isRandomAccessRange;

    static if (isNarrowString!S)
    {
        import std.utf : byCodeUnit;

        auto codeUnits = s.byCodeUnit;
    }
    else
    {
        alias codeUnits = s;
    }

    if (codeUnits.empty) return false;
    immutable f = codeUnits.front;
    if (!(f == '\'' || f == '\"')) return false;

    static if (isRandomAccessRange!(typeof(codeUnits)))
    {
        return codeUnits.length > 1 && codeUnits[$ - 1] == f;
    }
    else
    {
        codeUnits.popFront;
        if (codeUnits.empty) return false;

        for (;;)
        {
            immutable c = codeUnits.front;
            if (codeUnits.empty) return c == f;
            codeUnits.popFront;
        }
    }
}

///
@safe @nogc pure nothrow
unittest
{
    // Either single or double quotes are acceptable.
    assert(isQuotedString("'string'"));
    assert(isQuotedString("\"string\""));

    // Unmatched quotes are not accepted.
    assert(!isQuotedString("'string\""));
    assert(!isQuotedString("\"string'"));

    // A string must be quoted.
    assert(!isQuotedString("string"));
}

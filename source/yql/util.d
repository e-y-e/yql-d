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
 * $(TABLE
 *     $(TR $(TD $(B Template Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #isStatement, isStatement))
 *          $(TD Evaluates to true for types that form YQL statements))
 *     $(TR $(TD $(LINK2 #isQuery, isQuery))
 *          $(TD Evaluates to true for types that form YQL queries))
 *     $(TR $(TD $(LINK2 #StatementType, StatementType))
 *          $(TD Evaluates the base YQL statement type for a YQL query type))
 *     $(TR $(TD $(LINK2 #isOperator, isOperator))
 *          $(TD Evaluates to true for types that form conditional operators))
 *     $(TR $(TD $(LINK2 #isConditional, isConditional))
 *          $(TD Evaluates to true for types that form conditional expressions))
 *     $(TR $(TD $(LINK2 #isConditionalQuery, isConditionalQuery))
 *          $(TD Evaluates to true for queries that end in conditional
 *               expressions))
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

    codeUnits.popFront;
    if (codeUnits.empty) return false;

    for (;;)
    {
        immutable c = codeUnits.front;
        codeUnits.popFront;
        if (c == f) return codeUnits.empty;
        if (codeUnits.empty) return false;
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
    assert(!isQuotedString("'string'string'"));
    assert(!isQuotedString("'string''string'"));

    // A string must be quoted.
    assert(!isQuotedString("string"));
}

/**
 * Evaluates to true for types that form YQL statements.
 *
 * Params:
 *     Expr = (template parameter) the type of the expression
 */
enum isStatement(Expr) = __traits(isSame, from!"std.traits".TemplateOf!Expr,
                                  from!"yql.query".Select) ||
                         __traits(isSame, from!"std.traits".TemplateOf!Expr,
                                  from!"yql.query".InsertInto) ||
                         __traits(isSame, from!"std.traits".TemplateOf!Expr,
                                  from!"yql.query".Update) ||
                         __traits(isSame, from!"std.traits".TemplateOf!Expr,
                                  from!"yql.query".DeleteFrom);

///
@safe @nogc pure nothrow
unittest
{
}


/**
 * Evaluates to true for types that form YQL queries.
 *
 * Params:
 *     Expr = (template parameter) the type of the expression
 */
template isQuery(Expr)
{
    static if (__traits(hasMember, Expr, "query"))
    {
        enum isQuery = isQuery!(typeof(Expr.init.query));
    }
    else static if (__traits(hasMember, Expr, "lhs"))
    {
        enum isQuery = isQuery!(typeof(Expr.init.lhs));
    }
    else
    {
        enum isQuery = isStatement!Expr;
    }
}

///
@safe @nogc pure nothrow
unittest
{
}


/**
 * Evaluates the base YQL statement type for a YQL query type.
 *
 * Params:
 *     Query = (template parameter) the type of the query
 */
template StatementType(Query)
{
    static if (__traits(hasMember, Query, "query"))
    {
        alias StatementType = StatementType!(typeof(Query.init.query));
    }
    else static if (__traits(hasMember, Query, "lhs"))
    {
        alias StatementType = StatementType!(typeof(Query.init.lhs));
    }
    else static if (isStatement!Query)
    {
        alias StatementType = Query;
    }
    else
    {
        static assert(false, "Cannot find statement for non-query");
    }
}

///
@safe @nogc pure nothrow
unittest
{
}


/**
 * Evaluates to true for types that form conditional operators.
 *
 * Params:
 *     Expr = (template parameter) the type of the expression
 */
enum isOperator(Expr) = __traits(isSame, from!"std.traits".TemplateOf!Expr,
                                 from!"yql.query".Compare) ||
                        __traits(isSame, from!"std.traits".TemplateOf!Expr,
                                 from!"yql.query".Among) ||
                        __traits(isSame, from!"std.traits".TemplateOf!Expr,
                                 from!"yql.query".Between);

///
@safe @nogc pure nothrow
unittest
{
}


/**
 * Evaluates to true for types that form conditional expressions.
 *
 * Params:
 *     Expr = (template parameter) the type of the expression
 */
template isConditional(Expr)
{
    static if (__traits(isSame, from!"std.traits".TemplateOf!Expr,
                        from!"yql.query".And) ||
               __traits(isSame, from!"std.traits".TemplateOf!Expr,
                        from!"yql.query".Or))
    {
        enum isConditional = isConditional!(typeof(Expr.init.lhs)) &&
                             isConditional!(typeof(Expr.init.rhs));
    }
    else static if (__traits(isSame, from!"std.traits".TemplateOf!Expr,
                             from!"yql.query".Not))
    {
        enum isConditional = isConditional!(typeof(Expr.init.expr));
    }
    else
    {
        enum isConditional = isOperator!Expr;
    }
}

///
@safe @nogc pure nothrow
unittest
{
}

/**
 * Evaluates to true for queries that end in conditional expressions.
 */
enum isConditionalQuery(Expr) = isQuery!Expr &&
                                __traits(isSame,
                                          from!"std.traits".TemplateOf!Expr,
                                          from!"yql.query".Where) ||
                                 __traits(isSame,
                                          from!"std.traits".TemplateOf!Expr,
                                          from!"yql.query".And) ||
                                 __traits(isSame,
                                          from!"std.traits".TemplateOf!Expr,
                                          from!"yql.query".Or);

///
@safe @nogc pure nothrow
unittest
{
}

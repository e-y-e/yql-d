/**
 * Type-safe mechanisms for constructing YQL queries.
 *
 * Basic_Types:
 * The basic types represent the fundemental building blocks of YQL queries.
 * $(TABLE
 *     $(TR $(TD $(B Type Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #Table, Table)) $(TD Type representing a YQL table))
 *     $(TR $(TD $(LINK2 #Column, Column)) $(TD Type representing a YQL column))
 *     $(TR $(TD $(LINK2 #Value, Value)) $(TD Type representing a YQL value))
 *     $(TR $(TD $(LINK2 #Entry, Entry)) $(TD Type representing a YQL entry))
 * )
 *
 * $(TABLE
 *     $(TR $(TD $(B Function Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #table, table))
 *          $(TD Creates a $(LINK2 #Table, Table) with a given name))
 *     $(TR $(TD $(LINK2 #column, column))
 *          $(TD Creates a $(LINK2 #Column, Column) with a given name))
 *     $(TR $(TD $(LINK2 #value, value))
 *          $(TD Creates a $(LINK2 #Value, Value) with a given 'value string'))
 *     $(TR $(TD $(LINK2 #value, value))
 *          $(TD Creates an $(LINK2 #Entry, Entry) with a given column and
 *               value))
 * )
 *
 *
 * Basic_Comparisons:
 * The basic comparison types represent the building blocks of the conditional
 * expressions used as filters in the $(LINK2 #Where, Where) clause.
 * $(TABLE
 *     $(TR $(TD $(B Type Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #Compare, Compare))
 *          $(TD Type representing a generic comparison between a column and a
 *               single value))
 *     $(TR $(TD $(LINK2 #Between, Between))
 *          $(TD Type representing a comparison between a column and a lower
 *               value and an upper value))
 *     $(TR $(TD $(LINK2 #Among, Among))
 *          $(TD Type representing a comparison between a column and a range of
 *               possible values))
 * )
 *
 * $(TABLE
 *     $(TR $(TD $(B Function Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #compare, compare))
 *          $(TD Creates a generic $(LINK2 #Compare, Compare) object with a
 *               given column and value))
 *     $(TR $(TD $(LINK2 #equal, equal))
 *          $(TD Creates a $(LINK2 #Compare, Compare) object for the "="
 *               comparison with a given column and value))
 *     $(TR $(TD $(LINK2 #notEqual, notEqual))
 *          $(TD Creates a $(LINK2 #Compare, Compare) object for the "!="
 *               comparison with a given column and value))
 *     $(TR $(TD $(LINK2 #lessThan, lessThan))
 *          $(TD Creates a $(LINK2 #Compare, Compare) object for the "<"
 *               comparison with a given column and value))
 *     $(TR $(TD $(LINK2 #greaterThan, greaterThan))
 *          $(TD Creates a $(LINK2 #Compare, Compare) object for the ">"
 *               comparison with a given column and value))
 *     $(TR $(TD $(LINK2 #lessThanOrEqual, lessThanOrEqual))
 *          $(TD Creates a $(LINK2 #Compare, Compare) object for the "<="
 *               comparison with a given column and value))
 *     $(TR $(TD $(LINK2 #greaterThanOrEqual, greaterThanOrEqual))
 *          $(TD Creates a $(LINK2 #Compare, Compare) object for the ">="
 *               comparison with a given column and value))
 *     $(TR $(TD $(LINK2 #between, between))
 *          $(TD Creates a $(LINK2 #Between, Between) object with a given column
 *               and lower and upper values))
 *     $(TR $(TD $(LINK2 #among, among))
 *          $(TD Creates an $(LINK2 #Among, Among) object with a given column
 *               and values))
 * )
 *
 *
 * Conditional_Operators:
 * Conditional operators are used to compose the basic comparison types into
 * more complex conditional expressions.
 * $(TABLE
 *     $(TR $(TD $(B Type Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #And, And)) $(TD Type representing an 'and' operator))
 *     $(TR $(TD $(LINK2 #Or, Or)) $(TD Type representing an 'or' operator))
 *     $(TR $(TD $(LINK2 #Not, Not)) $(TD Type representing a 'not operator))
 * )
 *
 * $(TABLE
 *     $(TR $(TD $(B Function Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #and, and))
 *          $(TD Creates an $(LINK2 #And, And) object with the given left and
 *               right expressions))
 *     $(TR $(TD $(LINK2 #or, or))
 *          $(TD Creates an $(LINK2 #Or, Or) object with the given left and
 *               right expressions))
 *     $(TR $(TD $(LINK2 #not, not))
 *          $(TD Creates a $(LINK2 #Not, Not) object with the given expression))
 * )
 *
 *
 * Basic_Statements:
 * Basic statements are the actions that form the core of a single YQL _query.
 * Can be extended with clauses that restrict and refine the action.
 * $(TABLE
 *     $(TR $(TD $(B Type Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #Select, Select))
 *          $(TD Type representing a YQL 'select' statement))
 *     $(TR $(TD $(LINK2 #InsertInto, InsertInto))
 *          $(TD Type representing a YQL 'insert into' statement))
 *     $(TR $(TD $(LINK2 #Update, Update))
 *          $(TD Type representing a YQL 'update' statement))
 *     $(TR $(TD $(LINK2 #DeleteFrom, DeleteFrom))
 *          $(TD Type representing a YQL 'delete from' statement))
 * )
 *
 * $(TABLE
 *     $(TR $(TD $(B Function Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #select, select))
 *          $(TD Creates a $(LINK2 Select, Select) statement with the given
 *               table and columns))
 *     $(TR $(TD $(LINK2 #insertInto, insertInto))
 *          $(TD Creates an $(LINK2 #InsertInto, InsertInto) statement with the
 *               given table and values))
 *     $(TR $(TD $(LINK2 #update, update))
 *          $(TD Creates an $(LINK2 Update, Update) statement with the given
 *               table and column-value entries))
 *     $(TR $(TD $(LINK2 #deleteFrom, deleteFrom))
 *          $(TD Creates a $(LINK2 #DeleteFrom, DeleteFrom) statement with the
 *               given table))
 * )
 *
 *
 * Clauses:
 * Clauses are used to restrict and refine the action of basic statements to
 * create a complete query.
 * $(TABLE
 *     $(TR $(TD $(B Type Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #Where, Where))
 *          $(TD Type representing a YQL 'where' clause))
 *     $(TR $(TD $(LINK2 #Order, Order))
 *          $(TD Enumerated type representing sort order
 *               (ascending or descending)))
 *     $(TR $(TD $(LINK2 #OrderBy, OrderBy))
 *          $(TD Type representing a YQL 'order by' clause))
 *     $(TR $(TD $(LINK2 #GroupBy, GroupBy))
 *          $(TD Type representing a YQL 'group by' clause))
 * )
 *
 * $(TABLE
 *     $(TR $(TD $(B Function Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 #where, where))
 *          $(TD Creates a $(LINK2 #Where, Where) clause with the given
 *               query and conditional expression))
 *     $(TR $(TD $(LINK2 #orderBy, orderBy))
 *          $(TD Creates an $(LINK2 #OrderBy, OrderBy) clause with the given
 *               query, column and sort order))
 *     $(TR $(TD $(LINK2 #groupBy, groupBy))
 *          $(TD Creates a $(LINK2 #GroupBy, GroupBy) clause with the given
 *               query and column))
 * )
 *
 *
 * License:   $(LINK2 https://boost.org/LICENSE_1_0.txt, Boost License 1.0)
 * Copyright: Copyright © 2017, Lewis Revill
 * Authors:   Lewis Revill
 */
module yql.query;

/**
 * Sorting the top tech corporations by market capitalization.
 */
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    static immutable data = [column("Name"), column("Ask"), column("Bid"),
                             column("Change"), column("MarketCapitalization")];
    static immutable stocks = [value("'AAPL'"), value("'AMZN'"), value("'FB'"),
                               value("'GOOG'"), value("'YHOO'")];

    immutable query = table("yahoo.finance.quotes")
        .select(data)
        .where(column("symbol").among(stocks))
        .orderBy(column("MarketCapitalization"));

    assert(query.valid);
    assert(query.range
        .eq("select Name,Ask,Bid,Change,MarketCapitalization\n" ~
             "from yahoo.finance.quotes\n" ~
             "where symbol in ('AAPL','AMZN','FB','GOOG','YHOO')\n" ~
             "order by MarketCapitalization asc\n"));
}

/**
 * Finding good vegan restaurants in San Francisco.
 */
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    static immutable data = [column("Title"), column("Address"), column("City"),
                             column("BusinessURL"),
                             column("Rating"),
                             column("Categories")];

    immutable query = table("yahoo.local")
        .select(data)
        .where(column("query").equal(value("'vegan'")))
        .and(column("location").equal(value("'san francisco, ca'")))
        .and(column("Rating.TotalRatings").greaterThan(value("5")))
        .orderBy(column("Rating.AverageRating"), Order.descending);

    assert(query.valid);
    assert(query.range
        .eq("select Title,Address,City,BusinessURL,Rating,Categories\n" ~
            "from yahoo.local\n" ~
            "where query='vegan'\n" ~
            "and location='san francisco, ca'\n" ~
            "and Rating.TotalRatings>5\n" ~
            "order by Rating.AverageRating desc\n"));
}

/**
 * Querying a theoretical online marketplace for good value smartphones.
 */
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    static immutable data = [column("name"), column("price"), column("rating"),
                             column("discount")];

    immutable query = table("mycompany.yql.data")
        .select(data)
        .where(column("category").equal(value("'smartphones'")))
        .and(column("price").lessThan(value("300")))
        .and(column("rating").greaterThan(value("3.5"))
                 .or(column("discount").greaterThan(value("0.2"))))
        .orderBy(column("rating"), Order.descending)
        .orderBy(column("discount"), Order.descending);

    assert(query.valid);
    assert(query.range
        .eq("select name,price,rating,discount\n" ~
            "from mycompany.yql.data\n" ~
            "where category='smartphones'\n" ~
            "and price<300\n" ~
            "and (rating>3.5 or discount>0.2)\n" ~
            "order by rating desc\n" ~
            "order by discount desc\n"));
}


import yql.internal : from;

// Checks if the surrounding type is uninitialized.
private template validityCheck()
{
    @property bool valid() inout { return this != typeof(this).init; }
}


/**
 * Type representing a YQL table.
 *
 * This type stores a table name in the member variable `name`. If the given
 * table name was not valid, `name` is left uninitialized, and the property
 * `valid` returns false.
 *
 * Validation:
 * A valid table name consists of 1 or more period-separated identifiers. An
 * identifier consists of an alphabetic character or an underscore followed by 0
 * or more alphanumeric characters or underscores.
 *
 * Note:
 * Do not rely solely on the validation of this data type and others in this
 * module. It is advisable to check the status of the response before assuming
 * that a query worked correctly.
 *
 * Params:
 *     Char = (template parameter) character type used to represent the name
 */
struct Table(Char)
    if (from!"std.traits".isSomeChar!Char)
{
    alias String = immutable(Char)[];

    immutable String name;

    this(String name)
    {
        import yql.util : isYQLIdentifier;

        if (!name.isYQLIdentifier) return;

        this.name = name;
    }

    mixin validityCheck;

    @property auto range() inout { return name; }
}

/**
 * Creates a $(LINK2 #Table, Table) with a given _name.
 *
 * Params:
 *     Char = (template parameter) character type used to represent the _name
 *     name = the intended _name of the _table
 */
Table!Char table(Char)(immutable(Char)[] name)
    if (from!"std.traits".isSomeChar!Char)
{
    return Table!Char(name);
}

///
@safe @nogc pure nothrow
unittest
{
    // No issues with this table name.
    immutable data1 = table("mycompany.yql.data");
    assert(data1.valid);
    assert(data1.range == "mycompany.yql.data");

    // A small mistake.
    immutable data2 = table("mycompany,yql.data");
    // Caught the issue before going any further.
    assert(!data2.valid);
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL column.
 *
 * This type stores a column name in the member variable `name`. If the given
 * column name was not valid, `name` is left uninitialized, and the property
 * `valid` returns false.
 *
 * Validation:
 * A valid column name consists of 1 or more period-separated identifiers. An
 * identifier consists of an alphabetic character or an underscore followed by 0
 * or more alphanumeric characters or underscores.
 *
 * Note:
 * Do not rely solely on the validation of this data type and others in this
 * module. It is advisable to check the status of the response before assuming
 * that a query worked correctly.
 *
 * Params:
 *     Char = (template parameter) character type used to represent the name
 */
struct Column(Char)
    if (from!"std.traits".isSomeChar!Char)
{
    alias String = immutable(Char)[];

    immutable String name;

    this(String name)
    {
        import yql.util : isYQLIdentifier;

        if (!(name == "*" || name.isYQLIdentifier)) return;

        this.name = name;
    }

    mixin validityCheck;

    @property auto range() inout { return name; }
}

/**
 * Creates a $(LINK2 #Column, Column) with a given _name.
 *
 * Params:
 *     Char = (template parameter) character type used to represent the _name
 *     name = the intended _name of the _column
 */
Column!Char column(Char)(immutable(Char)[] name)
    if (from!"std.traits".isSomeChar!Char)
{
    return Column!Char(name);
}

///
@safe @nogc pure nothrow
unittest
{
    // No issues with this column name.
    immutable q1 = column("quantity");
    assert(q1.valid);
    assert(q1.range == "quantity");

    // The wildcard '*' is a valid column name.
    immutable all = column("*");
    assert(all.valid);
    assert(all.range == "*");

    // A small mistake.
    immutable q2 = column("$quantity");
    // Caught the issue before going any further.
    assert(!q2.valid);

    // Multiple names are not supported, use multiple columns instead.
    immutable qc = column("quantity,cost");
    assert(!qc.valid);

    // Period-separated identifiers are valid column names.
    immutable sq = column("stock.quantity");
    assert(sq.valid);
    assert(sq.range == "stock.quantity");
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL value.
 *
 * This type stores a 'value string' as a member, `str`, which has the value
 * "_null" if the string given to the constructor did not represent a non-_null
 * value.
 *
 * Validation:
 * A string can represent a value as either a number or a string. A number can
 * be represented as 1 or more digits, which may be followed by a decimal point
 * with 1 or more additional digits. A string is any set of characters enclosed
 * within double quotes.
 *
 * Note:
 * Do not rely solely on the validation of this data type and others in this
 * module. It is advisable to check the status of the response before assuming
 * that a query worked correctly.
 *
 * Params:
 *     Char = (template parameter) character type used to represent the value
 */
struct Value(Char)
    if (from!"std.traits".isSomeChar!Char)
{
    alias String = immutable(Char)[];

    immutable String str = "null";

    this(String str)
    {
        import yql.util : isNumber, isQuotedString;

        if (!(str.isNumber || str.isQuotedString)) return;

        this.str = str;
    }

    @property auto range() inout { return str; }
}

/**
 * Creates a $(LINK2 #Value, Value) with a given '_value string'.
 *
 * Params:
 *     Char = (template parameter) character type used to represent the _value
 *     str = the string representing the intended _value
 */
Value!Char value(Char)(immutable(Char)[] str)
    if (from!"std.traits".isSomeChar!Char)
{
    return Value!Char(str);
}

///
@safe @nogc pure nothrow
unittest
{
    // No issues with this string value.
    immutable lang1 = value("\"dlang\"");
    assert(lang1.range == "\"dlang\"");

    // Strings enclosed within single quotes are also supported.
    immutable lang2 = value("'dlang'");
    assert(lang2.range == "'dlang'");

    // A valid integer value.
    immutable i = value("1000");
    assert(i.range == "1000");

    // A valid decimal value.
    immutable d1 = value("1.00");
    assert(d1.range == "1.00");

    // Strings must be enclosed in double quotes.
    immutable lang3 = value("dlang");
    assert(lang3.range == "null");

    // Locales with commas as decimal marks are not currently supported.
    immutable d2 = value("1,00");
    assert(d2.range == "null");
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL entry.
 *
 * This type stores the column and value that represent a YQL table entry in the
 * member variables `column` and `value`. If the given column was not valid or
 * it represented the wildcard "*", the member variables are left uninitialized,
 * and the property `valid` returns false.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of each field
 */
struct Entry(Char)
{
    immutable Column!Char column;
    immutable Value!Char value;

    this(Column!Char column, Value!Char value)
    {
        if (!column.valid || column.name == "*") return;

        this.column = column;
        this.value = value;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;

        return chain(column.range, "=", value.range);
    }
}

/**
 * Creates an $(LINK2 #Entry, Entry) with a given _column and _value.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _column and _value
 *     column = the _column that the _entry refers to
 *     value = the _value for the _column
 */
Entry!Char entry(Char)(Column!Char column, Value!Char value)
{
    return Entry!Char(column, value);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    // Any valid column name can be used in an entry.
    immutable name1 = column("name").entry(value("'Thomas'"));
    assert(name1.valid);
    assert(name1.range.eq("name='Thomas'"));

    // Null values are fine in a valid entry.
    immutable tel = column("telno").entry(value("null"));
    assert(tel.valid);
    assert(tel.range.eq("telno=null"));

    // An invalid column gives an invalid entry.
    immutable name2 = column("name=").entry(value("'Thomas'"));
    assert(!name2.valid);

    // The wildcard "*", while a valid column name, cannot be used in an entry.
    immutable all = column("*").entry(value("'$$$'"));
    assert(!all.valid);
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a generic comparison between a column and a single value.
 *
 * Params:
 *     op = (template parameter) the specific comparison that the type
 *          represents, can be any of the following: =,!=,<,>,<=,>=
 *     Char = (template parameter) character type used in the underlying
 *            representation of the column and value
 */
struct Compare(string op, Char)
    if (op == "=" || op == "!=" || op == "<" || op == ">" || op == "<=" ||
        op == ">=")
{
    immutable Column!Char column;
    immutable Value!Char value;

    this(Column!Char column, Value!Char value)
    {
        static if (op == "=" || op == "!=")
        {
            if (!column.valid) return;
        }
        else
        {
            if (!column.valid || value.str == "null") return;
        }
        this.column = column;
        this.value = value;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;

        return chain(column.range, op, value.range);
    }
}

/**
 * Creates a generic $(LINK2 #Compare, Compare) object with a given _column and
 * _value.
 *
 * Params:
 *     op = (template parameter) the specific comparison that the type
 *          represents, can be any of the following: =,!=,<,>,<=,>=
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _column and _value
 *     column = the _column to be compared
 *     value = the _value to be compared against
 */
Compare!(op, Char) compare(string op, Char)(Column!Char column,
Value!Char value)
    if (op == "=" || op == "!=" || op == "<" || op == ">" || op == "<=" ||
        op == ">=")
{
    return Compare!(op, Char)(column, value);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    // This comparison is perfectly valid.
    immutable filter1 = column("symbol").equal(value("'AAPL'"));
    assert(filter1.valid);
    assert(filter1.range.eq("symbol='AAPL'"));

    // Valid comparisons always require a valid column.
    immutable filter2 = column("symbol=").equal(value("'AAPL'"));
    assert(!filter2.valid);

    // For direct comparisons, comparing against a null value is fine.
    immutable comp1 = column("rating").notEqual(value("null"));
    assert(comp1.valid);
    assert(comp1.range.eq("rating!=null"));

    // For ordered comparisons, comparing against a null value is not valid.
    immutable comp2 = column("rating").greaterThan(value("null"));
    assert(!comp2.valid);
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Creates a $(LINK2 #Compare, Compare) object for the "=" comparison with a
 * given _column and _value.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _column and _value
 *     column = the _column to be compared
 *     value = the _value to be compared against
 */
Compare!("=", Char) equal(Char)(Column!Char column, Value!Char value)
{
    return Compare!("=", Char)(column, value);
}

/**
 * Creates a $(LINK2 #Compare, Compare) object for the "!=" comparison with a
 * given _column and _value.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _column and _value
 *     column = the _column to be compared
 *     value = the _value to be compared against
 */
Compare!("!=", Char) notEqual(Char)(Column!Char column, Value!Char value)
{
    return Compare!("!=", Char)(column, value);
}

/**
 * Creates a $(LINK2 #Compare, Compare) object for the "<" comparison with a
 * given _column and _value.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _column and _value
 *     column = the _column to be compared
 *     value = the _value to be compared against
 */
Compare!("<", Char) lessThan(Char)(Column!Char column, Value!Char value)
{
    return Compare!("<", Char)(column, value);
}

/**
 * Creates a $(LINK2 #Compare, Compare) object for the ">" comparison with a
 * given _column and _value.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _column and _value
 *     column = the _column to be compared
 *     value = the _value to be compared against
 */
Compare!(">", Char) greaterThan(Char)(Column!Char column, Value!Char value)
{
    return Compare!(">", Char)(column, value);
}

/**
 * Creates a $(LINK2 #Compare, Compare) object for the "<=" comparison with a
 * given _column and _value.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _column and _value
 *     column = the _column to be compared
 *     value = the _value to be compared against
 */
Compare!("<=", Char) lessThanOrEqual(Char)(Column!Char column, Value!Char value)
{
    return Compare!("<=", Char)(column, value);
}

/**
 * Creates a $(LINK2 #Compare, Compare) object for the ">=" comparison with a
 * given _column and _value.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _column and _value
 *     column = the _column to be compared
 *     value = the _value to be compared against
 */
Compare!(">=", Char) greaterThanOrEqual(Char)(Column!Char column,
Value!Char value)
{
    return Compare!(">=", Char)(column, value);
}


/**
 * Type representing a comparison between a column and a lower value and an
 * upper value.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the column and lower and upper values
 */
struct Between(Char)
{
    immutable Column!Char column;
    immutable Value!Char lower;
    immutable Value!Char upper;

    this(Column!Char column, Value!Char lower, Value!Char upper)
    {
        if (!column.valid || lower.str == "null" || upper.str == "null") return;

        this.column = column;
        this.lower = lower;
        this.upper = upper;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;

        return chain(column.range, " between ", lower.range, " and ",
                     upper.range);
    }
}

/**
 * Creates a $(LINK2 #Between, Between) object with a given _column and _lower
 * and _upper values.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _column and _lower and _upper values
 *     column = the _column to be compared
 *     lower = the _lower limit of the possible values (inclusive)
 *     upper = the _upper limit of the possible values (inclusive)
 */
Between!Char between(Char)(Column!Char column, Value!Char lower,
Value!Char upper)
{
    return Between!Char(column, lower, upper);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    // This comparison is perfectly valid.
    immutable filter1 = column("price").between(value("50"), value("150"));
    assert(filter1.valid);
    assert(filter1.range.eq("price between 50 and 150"));

    // Valid comparisons always require a valid column.
    immutable filter2 = column("price$").between(value("50"), value("150"));
    assert(!filter2.valid);

    // If either value is null, the between comparison is not valid.
    immutable comp1 = column("price").between(value("100"), value("null"));
    assert(!comp1.valid);

    // Ditto for both null.
    immutable comp2 = column("price").between(value("null"), value("null"));
    assert(!comp2.valid);
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a comparison between a column and a range of possible
 * values.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the column and values
 */
struct Among(Char)
{
    alias Values = immutable(Value!Char)[];

    immutable Column!Char column;
    immutable Values values;

    this(Column!Char column, Values values)
    {
        if (!column.valid) return;

        this.column = column;
        this.values = values;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;
        import std.algorithm.iteration : map, joiner;

        return chain(column.range, " in (",
                     values.map!(v => v.range.dup).joiner(","), ")");
    }
}

/**
 * Creates an $(LINK2 #Among, Among) object with a given _column and _values.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the column and values
 *     column = the _column to compare against the _values
 *     values = the possible _values that the _column can take
 */
Among!Char among(Char)(Column!Char column, immutable(Value!Char)[] values)
{
    return Among!Char(column, values);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    static immutable symbols = [value("'AAPL'"), value("'GOOG'"),
                                value("'YHOO'")];

    // This comparison is perfectly valid.
    immutable filter1 = column("symbol").among(symbols);
    assert(filter1.valid);
    assert(filter1.range.eq("symbol in ('AAPL','GOOG','YHOO')"));

    // Valid comparisons always require a valid column name.
    immutable filter2 = column("symbol=").among(symbols);
    assert(!filter2.valid);

    // Any number of the values can be null.
    static immutable badStrings = [value("null"), value("''")];
    immutable sieve = column("name").among(badStrings);
    assert(sieve.valid);
    assert(sieve.range.eq("name in (null,'')"));
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing an 'and' operator.
 *
 * Params:
 *     LHS = (template parameter) the type of the left expression
 *     RHS = (template parameter) the type of the right expression
 */
struct And(LHS, RHS)
   if ((from!"yql.util".isConditional!LHS ||
        from!"yql.util".isQuery!LHS) && from!"yql.util".isConditional!RHS)
{
    immutable LHS lhs;
    immutable RHS rhs;

    this(LHS lhs, RHS rhs)
    {
        if (!lhs.valid || !rhs.valid) return;

        this.lhs = lhs;
        this.rhs = rhs;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import yql.util : isQuery;
        import std.range : chain;

        static if (__traits(isSame, from!"std.traits".TemplateOf!RHS, Or))
        {
            immutable rhsRange = chain("(", rhs.range, ")");
        }
        else
        {
            immutable rhsRange = rhs.range;
        }

        static if (isQuery!LHS)
        {
            return chain(lhs.range, "and ", rhsRange, "\n");
        }
        else
        {
            static if (__traits(isSame, from!"std.traits".TemplateOf!LHS, Or))
            {
                return chain("(", lhs.range, ") and ", rhsRange);
            }
            else
            {
                return chain(lhs.range, " and ", rhsRange);
            }
        }
    }
}

/**
 * Creates an $(LINK2 #And, And) object with the given left _and right
 * expressions.
 *
 * Params:
 *     LHS = (template parameter) the type of the left expression
 *     RHS = (template parameter) the type of the right expression
 *     lhs = the expression on the left of the operator
 *     rhs = the expression on the right of the operator
 */
And!(LHS, RHS) and(LHS, RHS)(LHS lhs, RHS rhs)
   if ((from!"yql.util".isConditional!LHS ||
        from!"yql.util".isConditionalQuery!LHS) &&
       from!"yql.util".isConditional!RHS)
{
    return And!(LHS, RHS)(lhs, rhs);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    immutable cond1 = column("price").lessThan(value("300"))
        .and(column("rating").greaterThan(value("3.5")));
    assert(cond1.valid);
    assert(cond1.range.eq("price<300 and rating>3.5"));

    // And expressions also handle parenthesis for sub-expressions.
    immutable cond2 = column("price").lessThan(value("300"))
        .and(column("rating").greaterThan(value("3.5"))
                 .or(column("discount").greaterThan(value("0.2"))));
    assert(cond2.valid);
    assert(cond2.range
        .eq("price<300 and (rating>3.5 or discount>0.2)"));
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing an 'or' operator.
 *
 * Params:
 *     LHS = (template parameter) the type of the left expression
 *     RHS = (template parameter) the type of the right expression
 */
struct Or(LHS, RHS)
   if ((from!"yql.util".isConditional!LHS ||
        from!"yql.util".isConditionalQuery!LHS) &&
       from!"yql.util".isConditional!RHS)
{
    immutable LHS lhs;
    immutable RHS rhs;

    this(LHS lhs, RHS rhs)
    {
        if (!lhs.valid || !rhs.valid) return;

        this.lhs = lhs;
        this.rhs = rhs;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import yql.util : isQuery;
        import std.range : chain;

        static if (isQuery!LHS)
        {
            return chain(lhs.range, "or ", rhs.range, "\n");
        }
        else
        {
            return chain(lhs.range, " or ", rhs.range);
        }
    }
}

/**
 * Creates an $(LINK2 #Or, Or) object with the given left and right expressions.
 *
 * Params:
 *     LHS = (template parameter) the type of the left expression
 *     RHS = (template parameter) the type of the right expression
 *     lhs = the expression on the left of the operator
 *     rhs = the expression on the right of the operator
 */
Or!(LHS, RHS) or(LHS, RHS)(LHS lhs, RHS rhs)
   if ((from!"yql.util".isConditional!LHS ||
        from!"yql.util".isQuery!LHS) && from!"yql.util".isConditional!RHS)
{
    return Or!(LHS, RHS)(lhs, rhs);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    immutable cond = column("price").lessThan(value("300"))
        .or(column("rating").greaterThan(value("4.5")));
    assert(cond.valid);
    assert(cond.range.eq("price<300 or rating>4.5"));
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a 'not' operator.
 *
 * Params:
 *     Expr = (template parameter) the type of the negated expression
 */
struct Not(Expr)
   if (from!"yql.util".isConditional!Expr)
{
    immutable Expr expr;

    this(Expr expr)
    {
        if (!expr.valid) return;

        this.expr = expr;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;

        static if (__traits(isSame, from!"std.traits".TemplateOf!Expr, And) ||
                   __traits(isSame, from!"std.traits".TemplateOf!Expr, Or))
        {
            return chain("not (", expr.range, ")");
        }
        else
        {
            return chain("not ", expr.range);
        }
    }
}

/**
 * Creates a $(LINK2 #Not, Not) object with the given expression.
 *
 * Params:
 *     Expr = (template parameter) the type of the negated expression
 *     expr = the negated expression
 */
Not!Expr not(Expr)(Expr expr)
   if (from!"yql.util".isConditional!Expr)
{
    return Not!Expr(expr);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    immutable cond1 = not(column("brand").equal(value("'samsung'")));
    assert(cond1.valid);
    assert(cond1.range.eq("not brand='samsung'"));

    // Not expressions also handle parenthesis for sub-expressions.
    immutable cond2 = not(column("brand").equal(value("'samsung'"))
                              .or(column("condition").equal(value("'used'"))));
    assert(cond2.valid);
    assert(cond2.range.eq("not (brand='samsung' or condition='used')"));
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL 'select' statement.
 *
 * This type stores the table and columns that represent a YQL 'select'
 * statement in the member variables `table` and `columns`. If the given table
 * or any of the columns were not valid, the member variables are left
 * uninitialized, and the property `valid` returns false.
 *
 * Clauses:
 * A 'select' statement on its own is a complete query, but can also be extended
 * with the following clauses:
 * $(UL
 *     $(LI $(LINK2 #Where, Where))
 *     $(LI $(LINK2 #Order, Order))
 *     $(LI $(LINK2 #Group, Group))
 * )
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of each field
 */
struct Select(Char)
{
    alias Columns = immutable(Column!Char)[];

    immutable Table!Char table;
    immutable Columns columns;

    this(Table!Char table, Columns columns)
    {
        import std.algorithm.searching : any;

        if (!table.valid || columns.length == 0 ||
            columns.any!(c => !c.valid)) return;

        this.table = table;
        this.columns = columns;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;
        import std.algorithm.iteration : map, joiner;

        return chain("select ", columns.map!(c => c.range.dup).joiner(","),
                     "\nfrom ", table.range, "\n");
    }
}

/**
 * Creates a $(LINK2 Select, Select) statement with the given _table and
 * _columns.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _table and _columns
 *     table = the _table to _select data from
 *     columns = the _columns to return in the result set
 */
Select!Char select(Char)(Table!Char table, immutable(Column!Char)[] columns)
{
    return Select!Char(table, columns);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    static immutable columns = [column("name"), column("price")];

    immutable statement = table("mycompany.yql.data")
        .select(columns);
    assert(statement.valid);
    assert(statement.range.eq("select name,price\n" ~
                              "from mycompany.yql.data\n"));
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL 'insert into' statement.
 *
 * This type stores the table and values that represent a YQL 'insert into'
 * statement in the member variables `table` and `values`. If the `verbose` flag
 * is set, the columns that are present in the _verbose statement are stored in
 * the `columns` member variable. If the given table is not valid, or if
 * `verbose` is set and either the number of columns doesn't match the number of
 * values or any of the columns are not valid, the member variables are left
 * uninitialized, and the property `valid` returns false.
 *
 * Clauses:
 * An 'insert into' statement on its own is a complete query, and can not be extended
 * with additional clauses.
 *
 * Params:
 *     verbose = (template parameter) whether the statement specifies columns
 *     Char = (template parameter) character type used in the underlying
 *            representation of each field
 */
struct InsertInto(from!"std.typecons".Flag!"verbose" verbose, Char)
{
    alias Values = immutable(Value!Char)[];

    immutable Table!Char table;
    immutable Values values;

    static if (verbose)
    {
        alias Columns = immutable(Column!Char)[];

        Columns columns;

        this(Table!Char table, Columns columns, Values values)
        {
            import std.algorithm.searching : any;

            if (!table.valid || columns.length != values.length ||
                columns.any!(c => !c.valid)) return;

            this.table = table;
            this.columns = columns;
            this.values = values;
        }
    }
    else
    {
        this(Table!Char table, Values values)
        {
            if (!table.valid) return;

            this.table = table;
            this.values = values;
        }
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;
        import std.algorithm.iteration : map, joiner;

        static if (verbose)
        {
            return chain("insert into ", table.range, " (",
                         columns.map!(c => c.range.dup).joiner(","), ")\nvalues (",
                         values.map!(v => v.range.dup).joiner(","), ")\n");
        }
        else
        {
            return chain("insert into ", table.range, "\nvalues (",
                         values.map!(v => v.range.dup).joiner(","), ")\n");
        }
    }
}

/**
 * Creates an $(LINK2 #InsertInto, InsertInto) statement with the given _table
 * and _values.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _table and _values
 *     table = the _table to insert data into
 *     values = the _values to insert
 */
InsertInto!(from!"std.typecons".No.verbose, Char) insertInto(Char)
(Table!Char table, immutable(Value!Char)[] values)
{
    import std.typecons : No;

    return InsertInto!(No.verbose, Char)(table, values);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    static immutable values = [value("'Chair'"), value("300"), value("4.5")];

    immutable statement = insertInto(table("mycompany.yql.data"), values);
    assert(statement.valid);
    assert(statement.range.eq("insert into mycompany.yql.data\n" ~
                              "values ('Chair',300,4.5)\n"));
}

/**
 * Creates an $(LINK2 #InsertInto, InsertInto) statement with the given _table,
 * _columns and _values.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _table, _columns and _values
 *     table = the _table to insert data into
 *     columns = the _columns to insert data into
 *     values = the _values to insert
 */
InsertInto!(from!"std.typecons".Yes.verbose, Char) insertInto(Char)
(Table!Char table, immutable(Column!Char)[] columns,
immutable(Value!Char)[] values)
{
    import std.typecons : Yes;

    return InsertInto!(Yes.verbose, Char)(table, columns, values);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    static immutable columns = [column("name"), column("price"),
                                column("rating")];
    static immutable values = [value("'Chair'"), value("300"), value("4.5")];

    immutable statement = insertInto(table("mycompany.yql.data"), columns,
                                     values);
    assert(statement.valid);
    assert(statement.range
        .eq("insert into mycompany.yql.data (name,price,rating)\n" ~
            "values ('Chair',300,4.5)\n"));
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL 'update' statement.
 *
 * This type stores the table and column-value entries that represent a YQL
 * 'update' statement in the member variables `table` and `entries`. If the
 * given table or any of the column-value entries were not valid, the member
 * variables are left uninitialized, and the property `valid` returns false.
 *
 * Clauses:
 * An 'update' statement on its own is a complete query, but can also be extended
 * with the following clauses:
 * $(UL
 *     $(LI $(LINK2 #Where, Where))
 * )
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of each field
 */
struct Update(Char)
{
    alias Entries = immutable(Entry!Char)[];

    immutable Table!Char table;
    immutable Entries entries;

    this(Table!Char table, Entries entries)
    {
        import std.algorithm.searching : any;

        if (!table.valid || entries.length == 0 ||
            entries.any!(e => !e.valid)) return;

        this.table = table;
        this.entries = entries;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;
        import std.algorithm.iteration : map, joiner;

        return chain("update ", table.range, "\nset ",
                     entries.map!(e => e.range).joiner(","), "\n");
    }
}

/**
 * Creates an $(LINK2 Update, Update) statement with the given _table and
 * column-value _entries.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _table and column-value _entries
 *     table = the _table to _update
 *     entries = the column-value _entries to _update the _table with
 */
Update!Char update(Char)(Table!Char table, immutable(Entry!Char)[] entries)
{
    return Update!Char(table, entries);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    static immutable entries = [entry(column("price"), value("50")),
                                entry(column("discount"), value("0.2"))];

    immutable statement = update(table("mycompany.yql.data"), entries);
    assert(statement.valid);
    assert(statement.range.eq("update mycompany.yql.data\n" ~
                              "set price=50,discount=0.2\n"));
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL 'delete from' statement.
 *
 * This type stores the table that represents a YQL 'delete from' statement in
 * the member variable `table`. If the given table was not valid, the member
 * variables are left uninitialized, and the property `valid` returns false.
 *
 * Clauses:
 * A 'delete from' statement on its own is a complete query, but can also be
 * extended with the following clauses:
 * $(UL
 *     $(LI $(LINK2 #Where, Where))
 * )
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of each field
 */
struct DeleteFrom(Char)
{
    immutable Table!Char table;

    this(Table!Char table)
    {
        if (!table.valid) return;

        this.table = table;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;

        return chain("delete from ", table.range, "\n");
    }
}

/**
 * Creates a $(LINK2 #DeleteFrom, DeleteFrom) statement with the given _table.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _table
 *     table = the _table to perform the delete operation on
 */
DeleteFrom!Char deleteFrom(Char)(Table!Char table)
{
    return DeleteFrom!Char(table);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    immutable statement = deleteFrom(table("mycompany.yql.data"));
    assert(statement.valid);
    assert(statement.range.eq("delete from mycompany.yql.data\n"));
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL 'where' clause.
 *
 * Params:
 *     Query = (template parameter) the type of the query that comes before the
 *             clause
 *     Expr = (template parameter) the type of the conditional expression
 */
struct Where(Query, Expr)
    if (from!"yql.util".isQuery!Query && from!"yql.util".isConditional!Expr)
{
    immutable Query query;
    immutable Expr expr;

    this(Query query, Expr expr)
    {
        if (!query.valid || !expr.valid) return;

        this.query = query;
        this.expr = expr;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;

        return chain(query.range, "where ", expr.range, "\n");
    }
}

/**
 * Creates a $(LINK2 #Where, Where) clause with the given _query and
 * conditional expression.
 *
 * Params:
 *     Query = (template parameter) the type of the _query that comes before the
 *             clause
 *     Expr = (template parameter) the type of the conditional expression
 *     query = the part of the _query that occurs before this clause
 *     expr = the conditional expression given to this 'where' clause
 */
Where!(Query, Expr) where(Query, Expr)(Query query, Expr expr)
    if (from!"yql.util".isQuery!Query && from!"yql.util".isConditional!Expr)
{
    return Where!(Query, Expr)(query, expr);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    static immutable columns = [column("Ask"), column("Bid")];

    immutable query = table("yahoo.finance.quotes")
        .select(columns)
        .where(column("symbol").equal(value("'AAPL'")));
    assert(query.valid);

    assert(query.range.eq("select Ask,Bid\n" ~
                          "from yahoo.finance.quotes\n" ~
                          "where symbol='AAPL'\n"));
}

@safe @nogc pure nothrow
unittest
{
}


/**
 *
 */
enum Order : string
{
    ascending = "asc",
    descending = "desc"
}

/**
 * Type representing a YQL 'order by' clause
 *
 * Params:
 *     Query = (template parameter) the type of the query that comes before the
 *             clause
 *     Char = (template parameter) character type used in the underlying
 *            representation of the column
 */
struct OrderBy(Query, Char)
    if (from!"yql.util".isQuery!Query &&
        is(from!"yql.util".StatementType!Query : Select!Char))
{
    immutable Query query;
    immutable Column!Char column;
    immutable Order order;

    this(Query query, Column!Char column, Order order)
    {
        if (!query.valid || !column.valid) return;

        this.query = query;
        this.column = column;
        this.order = order;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;

        return chain(query.range, "order by ", column.range, " ",
                     cast(string)order, "\n");
    }
}

/**
 * Creates an $(LINK2 #OrderBy, OrderBy) clause with the given _query, _column
 * and sort _order.
 *
 * Params:
 *     Query = (template parameter) the type of the _query that comes before the
 *             clause
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _column
 *     query = the part of the _query that occurs before this clause
 *     column = the _column to order the results by
 *     order = the _order in which to sort the results
 */
OrderBy!(Query, Char) orderBy(Query, Char)(Query query, Column!Char column,
Order order = Order.ascending)
    if (from!"yql.util".isQuery!Query &&
        is(from!"yql.util".StatementType!Query : Select!Char))
{
    return OrderBy!(Query, Char)(query, column, order);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    static immutable columns = [column("Ask"), column("Bid")];
    static immutable symbols = [value("'AAPL'"), value("'GOOG'"),
                                value("'YHOO'")];

    immutable query = table("yahoo.finance.quotes")
        .select(columns)
        .where(column("symbol").among(symbols))
        .orderBy(column("MarketCapitalization"));
    assert(query.valid);
    assert(query.range.eq("select Ask,Bid\n" ~
                          "from yahoo.finance.quotes\n" ~
                          "where symbol in ('AAPL','GOOG','YHOO')\n" ~
                          "order by MarketCapitalization asc\n"));
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL 'group by' clause.
 *
 * Params:
 *     Query = (template parameter) the type of the query that comes before the
 *             clause
 *     Char = (template parameter) character type used in the underlying
 *            representation of the column
 */
struct GroupBy(Query, Char)
    if (from!"yql.util".isQuery!Query &&
        is(from!"yql.util".StatementType!Query : Select!Char))
{
    immutable Query query;
    immutable Column!Char column;

    this(Query query, Column!Char column)
    {
        if (!query.valid || !column.valid) return;

        this.query = query;
        this.column = column;
    }

    mixin validityCheck;

    @property auto range() inout
    {
        import std.range : chain;

        return chain(query.range, "group by ", column.range, "\n");
    }
}

/**
 * Creates a $(LINK2 #GroupBy, GroupBy) clause with the given _query and
 * _column.
 *
 * Params:
 *     Query = (template parameter) the type of the _query that comes before the
 *             clause
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _column
 *     query = the part of the _query that occurs before this clause
 *     column = the _column to group the results by
 */
GroupBy!(Query, Char) groupBy(Query, Char)(Query query, Column!Char column)
    if (from!"yql.util".isQuery!Query &&
        is(from!"yql.util".StatementType!Query : Select!Char))
{
    return GroupBy!(Query, Char)(query, column);
}

///
@safe pure
unittest
{
    import std.algorithm.comparison : eq = equal;

    static immutable columns = [column("name"), column("price")];

    immutable query = table("mycompany.yql.data")
        .select(columns)
        .where(column("price").lessThan(value("300")))
        .groupBy(column("category"));
    assert(query.valid);
    assert(query.range.eq("select name,price\n" ~
                          "from mycompany.yql.data\n" ~
                          "where price<300\n" ~
                          "group by category\n"));
}

@safe @nogc pure nothrow
unittest
{
}

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
 * create a complete statement.
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
 *               statement and conditional expression))
 *     $(TR $(TD $(LINK2 #orderBy, orderBy))
 *          $(TD Creates an $(LINK2 #OrderBy, OrderBy) clause with the given
 *               statement, column and sort order))
 *     $(TR $(TD $(LINK2 #groupBy, groupBy))
 *          $(TD Creates a $(LINK2 #GroupBy, GroupBy) clause with the given
 *               statement and column))
 * )
 *
 *
 * License:   $(LINK2 https://boost.org/LICENSE_1_0.txt, Boost License 1.0)
 * Copyright: Copyright © 2017, Lewis Revill
 * Authors:   Lewis Revill
 */
module yql.query;

///
@safe @nogc pure nothrow
unittest
{
    static immutable data = [column("Ask"), column("Bid"), column("Change")];
    static immutable stocks = [value("'FB'"), value("'GOOG'"), value("'AMZN'")];

    immutable query = table("yahoo.finance.quotes")
        .select(data)
        .where(column("symbol").among(stocks))
        .orderBy(column("Ask"));

    assert(query.valid);
//     assert(query.asRange
//         .equal("select Ask,Bid,Change
//                 from yahoo.finance.tables
//                 where symbol in ('FB','GOOG','AMZN')
//                 order by Ask"));
}

///
@safe @nogc pure nothrow
unittest
{
    static immutable data = [column("Title"), column("Address"), column("City"),
                             column("BusinessURL"),
                             column("Rating.AverageRating"),
                             column("Categories")];

    immutable query = table("yahoo.local")
        .select(data)
        .where(column("query").equal(value("'vegan'")))
        .and(column("location").equal(value("'san francisco, ca'")))
        .and(column("Rating.TotalRatings").greaterThan(value("5")))
        .orderBy(column("Rating.AverageRating"), Order.descending);

    assert(query.valid);
//     assert(query.asRange
//         .equal("select Title,Address,City,BusinessURL,Rating.AverageRating,Categories
//                 from yahoo.local
//                 where query='vegan'
//                 and location='san francisco, ca'
//                 and Rating.TotalRatings>5
//                 order by Rating.AverageRating DESC"));
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
    assert(data1.name == "mycompany.yql.data");

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
    assert(q1.name == "quantity");

    // The wildcard '*' is a valid column name.
    immutable all = column("*");
    assert(all.valid);
    assert(all.name == "*");

    // A small mistake.
    immutable q2 = column("$quantity");
    // Caught the issue before going any further.
    assert(!q2.valid);

    // Multiple names are not supported, use multiple columns instead.
    immutable qc = column("quantity,cost");
    assert(!qc.valid);
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

    String str = "null";

    this(String str)
    {
        import yql.util : isNumber, isQuotedString;

        if (!(str.isNumber || str.isQuotedString)) return;

        this.str = str;
    }
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
    assert(lang1.str == "\"dlang\"");

    // Strings enclosed within single quotes are also supported.
    immutable lang3 = value("'dlang'");
    assert(lang3.str == "'dlang'");

    // A valid integer value.
    immutable i = value("1000");
    assert(i.str == "1000");

    // A valid decimal value.
    immutable d1 = value("1.00");
    assert(d1.str == "1.00");

    // Strings must be enclosed in double quotes.
    immutable lang2 = value("dlang");
    assert(lang2.str == "null");

    // Locales with commas as decimal marks are not currently supported.
    immutable d2 = value("1,00");
    assert(d2.str == "null");
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL entry.
 *
 * This type stores the column and value that represent a YQL table entry in the
 * member variables `column` and `value`. If the given column was not valid, the
 * member variables are left uninitialized, and the property `valid` returns
 * false.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of each field
 */
struct Entry(Char)
{
    Column!Char column;
    Value!Char value;

    this(Column!Char column, Value!Char value)
    {
        if (!column.valid) return;

        this.column = column;
        this.value = value;
    }

    mixin validityCheck;
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
@safe @nogc pure nothrow
unittest
{
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a generic comparison between a column and a single value.
 */
struct Compare(string op, Char)
    if (op == "=" || op == "!=" || op == "<" || op == ">" || op == "<=" ||
        op == ">=")
{
    Column!Char column;
    Value!Char value;

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
}

/**
 * Creates a generic $(LINK2 #Compare, Compare) object with a given _column and
 * _value.
 */
Compare!(op, Char) compare(string op, Char)(Column!Char column,
Value!Char value)
    if (op == "=" || op == "!=" || op == "<" || op == ">" || op == "<=" ||
        op == ">=")
{
    return Compare!(op, Char)(column, value);
}

///
@safe @nogc pure nothrow
unittest
{
    immutable comp = column("symbol").equal(value("\"AAPL\""));
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Creates a $(LINK2 #Compare, Compare) object for the "=" comparison with a
 * given _column and _value.
 */
Compare!("=", Char) equal(Char)(Column!Char column, Value!Char value)
{
    return Compare!("=", Char)(column, value);
}

/**
 * Creates a $(LINK2 #Compare, Compare) object for the "!=" comparison with a
 * given _column and _value.
 */
Compare!("!=", Char) notEqual(Char)(Column!Char column, Value!Char value)
{
    return Compare!("!=", Char)(column, value);
}

/**
 * Creates a $(LINK2 #Compare, Compare) object for the "<" comparison with a
 * given _column and _value.
 */
Compare!("<", Char) lessThan(Char)(Column!Char column, Value!Char value)
{
    return Compare!("<", Char)(column, value);
}

/**
 * Creates a $(LINK2 #Compare, Compare) object for the ">" comparison with a
 * given _column and _value.
 */
Compare!(">", Char) greaterThan(Char)(Column!Char column, Value!Char value)
{
    return Compare!(">", Char)(column, value);
}

/**
 * Creates a $(LINK2 #Compare, Compare) object for the "<=" comparison with a
 * given _column and _value.
 */
Compare!("<=", Char) lessThanOrEqual(Char)(Column!Char column, Value!Char value)
{
    return Compare!("<=", Char)(column, value);
}

/**
 * Creates a $(LINK2 #Compare, Compare) object for the ">=" comparison with a
 * given _column and _value.
 */
Compare!(">=", Char) greaterThanOrEqual(Char)(Column!Char column,
Value!Char value)
{
    return Compare!(">=", Char)(column, value);
}


/**
 * Type representing a comparison between a column and a lower value and an
 * upper value.
 */
struct Between(Char)
{
    Column!Char column;
    Value!Char lower;
    Value!Char upper;

    this(Column!Char column, Value!Char lower, Value!Char upper)
    {
        if (!column.valid || lower.str == "null" || upper.str == "null") return;

        this.column = column;
        this.lower = lower;
        this.upper = upper;
    }

    mixin validityCheck;
}

/**
 * Creates a $(LINK2 #Between, Between) object with a given _column and _lower
 * and _upper values.
 */
Between!Char between(Char)(Column!Char column, Value!Char lower,
Value!Char upper)
{
    return Between!Char(column, lower, upper);
}

///
@safe @nogc pure nothrow
unittest
{
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a comparison between a column and a range of possible
 * values.
 */
struct Among(Char)
{
    alias Values = immutable(Value!Char)[];

    Column!Char column;
    Values values;

    this(Column!Char column, Values values)
    {
        if (!column.valid) return;

        this.column = column;
        this.values = values;
    }

    mixin validityCheck;
}

/**
 * Creates an $(LINK2 #Among, Among) object with a given _column and _values.
 */
Among!Char among(Char)(Column!Char column, immutable(Value!Char)[] values)
{
    return Among!Char(column, values);
}

///
@safe @nogc pure nothrow
unittest
{
    static immutable symbols = [value("\"AAPL\""), value("\"GOOG\""),
                                value("\"YHOO\"")];

    immutable cond = column("symbol").among(symbols);
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing an 'and' operator.
 */
struct And(LHS, RHS)
{
    LHS lhs;
    RHS rhs;

    this(LHS lhs, RHS rhs)
    {
        if (!lhs.valid || !rhs.valid) return;

        this.lhs = lhs;
        this.rhs = rhs;
    }

    mixin validityCheck;
}

/**
 * Creates an $(LINK2 #And, And) object with the given left and right expressions.
 */
And!(LHS, RHS) and(LHS, RHS)(LHS lhs, RHS rhs)
{
    return And!(LHS, RHS)(lhs, rhs);
}

///
@safe @nogc pure nothrow
unittest
{
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing an 'or' operator.
 */
struct Or(LHS, RHS)
{
    LHS lhs;
    RHS rhs;

    this(LHS lhs, RHS rhs)
    {
        if (!lhs.valid || !rhs.valid) return;

        this.lhs = lhs;
        this.rhs = rhs;
    }

    mixin validityCheck;
}

/**
 * Creates an $(LINK2 #Or, Or) object with the given left and right expressions.
 */
Or!(LHS, RHS) or(LHS, RHS)(LHS lhs, RHS rhs)
{
    return Or!(LHS, RHS)(lhs, rhs);
}

///
@safe @nogc pure nothrow
unittest
{
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a 'not' operator.
 */
struct Not(Expr)
{
    Expr expr;

    this(Expr expr)
    {
        if (!expr.valid) return;

        this.expr = expr;
    }

    mixin validityCheck;
}

/**
 * Creates a $(LINK2 #Not, Not) object with the given expression.
 */
Not!Expr not(Expr)(Expr expr)
{
    return Not!Expr(expr);
}

///
@safe @nogc pure nothrow
unittest
{
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

    Table!Char table;
    Columns columns;

    this(Table!Char table, Columns columns)
    {
        import std.algorithm.searching : any;

        if (!table.valid || columns.length == 0 ||
            columns.any!(c => !c.valid)) return;

        this.table = table;
        this.columns = columns;
    }

    mixin validityCheck;
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
@safe @nogc pure nothrow
unittest
{
    static immutable columns = [column("quantity")];

    immutable statement = select(table("mycompany.yql.data"), columns);
    assert(statement.valid);
    assert(statement.table.name == "mycompany.yql.data");
    assert(statement.columns[0].name == "quantity");
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

    Table!Char table;
    Values values;

    static if (verbose)
    {
        alias Columns = immutable(Column!Char)[];

        Columns columns;

        this(Table!Char table, Columns columns, Values values)
        {
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
            if (!table.length) return;

            this.table = table;
            this.values = values;
        }
    }

    mixin validityCheck;
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
@safe @nogc pure nothrow
unittest
{
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
@safe @nogc pure nothrow
unittest
{
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

    Table!Char table;
    Entries entries;

    this(Table!Char table, Entries entries)
    {
        import std.algorithm.searching : any;

        if (!table.valid || entries.length == 0 ||
            entries.any!(e => !e.valid)) return;

        this.table = table;
        this.entries = entries;
    }

    mixin validityCheck;
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
@safe @nogc pure nothrow
unittest
{
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
    Table!Char table;

    this(Table!Char table)
    {
        if (!table.valid) return;

        this.table = table;
    }

    mixin validityCheck;
}

/**
 * Creates a $(LINK2 #DeleteFrom, DeleteFrom) statement with the given _table.
 *
 * Params:
 *     Char = (template parameter) character type used in the underlying
 *            representation of the _table
 *     table = the _table to perform the delete operation on
 */
Delete!Char deleteFrom(Char)(Table!Char table)
{
    return Delete!Char(table);
}

///
@safe @nogc pure nothrow
unittest
{
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL 'where' clause.
 */
struct Where(Statement, Expr)
{
    Statement statement;
    Expr expr;

    this(Statement statement, Expr expr)
    {
        if (!statement.valid || !expr.valid) return;

        this.statement = statement;
        this.expr = expr;
    }

    mixin validityCheck;
}

/**
 * Creates a $(LINK2 #Where, Where) clause with the given _statement and
 * conditional expression.
 */
Where!(Statement, Expr) where(Statement, Expr)(Statement statement, Expr expr)
{
    return Where!(Statement, Expr)(statement, expr);
}

///
@safe @nogc pure nothrow
unittest
{
}

@safe @nogc pure nothrow
unittest
{
}


/**
 *
 */
enum Order
{
    ascending,
    descending
}

/**
 * Type representing a YQL 'order by' clause
 */
struct OrderBy(Statement, Char)
{
    Statement statement;
    Column!Char column;
    Order order;

    this(Statement statement, Column!Char column, Order order)
    {
        if (!statement.valid || !column.valid) return;

        this.statement = statement;
        this.column = column;
        this.order = order;
    }

    mixin validityCheck;
}

/**
 * Creates an $(LINK2 #OrderBy, OrderBy) clause with the given _statement,
 * _column and sort _order.
 */
OrderBy!(Statement, Char) orderBy(Statement, Char)(Statement statement,
Column!Char column, Order order = Order.ascending)
{
    return OrderBy!(Statement, Char)(statement, column, order);
}

///
@safe @nogc pure nothrow
unittest
{
}

@safe @nogc pure nothrow
unittest
{
}


/**
 * Type representing a YQL 'group by' clause
 */
struct GroupBy(Statement, Char)
{
    Statement statement;
    Column!Char column;

    this(Statement statement, Column!Char column)
    {
        if (!statement.valid || !column.valid) return;

        this.statement = statement;
        this.column = column;
    }

    mixin validityCheck;
}

/**
 * Creates a $(LINK2 #GroupBy, GroupBy) clause with the given _statement and
 * _column.
 */
GroupBy!(Statement, Char) groupBy(Statement, Char)(Statement statement,
Column!Char column)
{
    return GroupBy!(Statement, Char)(statement, column);
}

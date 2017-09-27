/**
 * This package provides a layer of abstraction over YQL queries and responses,
 * to enable safe and expressive use of the web interface from D code.
 *
 * $(TABLE
 *     $(TR $(TD $(B Module Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 _yql.query.html, _yql.query))
 *          $(TD Type-safe mechanisms for constructing YQL queries))
 *     $(TR $(TD $(LINK2 _yql.response.html, _yql.response))
 *          $(TD Type-safe mechanisms for processing YQL responses))
 * )
 *
 * License:   $(LINK2 https://boost.org/LICENSE_1_0.txt, Boost License 1.0)
 * Copyright: Copyright © 2017, Lewis Revill
 * Authors:   Lewis Revill
 */
module yql;

public import yql.query;
public import yql.response;

/**
 * Analyzing tech corporations by market capitalization.
 */
@safe @nogc pure nothrow
unittest
{
    import std.algorithm.searching : all;

    static immutable data = [column("Name"), column("MarketCapitalization"), column("Ask"), column("Bid"), column("Change")];

    static immutable stocks = [value("'AAPL'"), value("'GOOG'"), value("'YHOO'"), value("'FB'"), value("'AMZN'")];
    assert(stocks.all!(v => v.str != "null"));

    immutable query = table("yahoo.finance.quotes")
        .select(data)
        .where(column("symbol").among(stocks))
        .orderBy(column("MarketCapitalization"), Order.descending);
    assert(query.valid);

//     immutable uri = query
//         .range
//         .uri;
}

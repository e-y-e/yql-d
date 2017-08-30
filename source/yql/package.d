/**
 * This package provides a layer of abstraction over YQL queries and responses,
 * to enable safe and expressive use of the web interface from D code.
 *
 * $(TABLE
 *     $(TR $(TD $(B Module Name)) $(TD $(B Description)))
 *     $(TR $(TD $(LINK2 query.html, yql.query))
 *          $(TD Type-safe mechanisms for constructing YQL queries))
 *     $(TR $(TD $(LINK2 response.html, yql.response))
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

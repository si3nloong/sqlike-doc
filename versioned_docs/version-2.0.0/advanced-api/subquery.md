---
sidebar_position: 1
---

# Sub-query

```go
import (
    "context"
    "github.com/si3nloong/sqlike/actions"
    "github.com/si3nloong/sqlike/options"
    "github.com/si3nloong/sqlike/sql/expr"
)

/*
    SELECT * FROM `sqlike`.`NormalStruct`
    WHERE (
        `ID` IN (
            SELECT `ID` FROM `sqlike`.`NormalStruct`
            WHERE `Tinyint` BETWEEN 1 AND 100
            ORDER BY `Timestamp` DESC
        ) AND
        EXISTS (SELECT 1 FROM `sqlike`.`NormalStruct`)
    )
    ORDER BY FIELD(`Enum`,"SUCCESS","FAILED","UNKNOWN")
    LIMIT 100;
*/

table := client.Database("sqlike").Table("Users")
result, err = table.Find(
    context.Background(),
    actions.Find().
        Where(
            expr.In("ID", actions.Find().
                Select("ID").
                From("sqlike", "NormalStruct").
                Where(
                    expr.Between("Tinyint", 1, 100),
                ).
                OrderBy(
                    expr.Desc("Timestamp"),
                ),
            ),
            expr.Exists(
                actions.Find().
                    Select(expr.Raw("1")).
                    From("sqlike", "NormalStruct"),
            ),
        ).
        OrderBy(
            expr.Field("Enum", []Enum{
                Success,
                Failed,
                Unknown,
            }),
        ),
    options.Find().SetDebug(true),
)

```

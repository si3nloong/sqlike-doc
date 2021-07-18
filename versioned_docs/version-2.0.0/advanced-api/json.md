---
sidebar_position: 2
---

# JSON

```go
import (
    "context"
    "github.com/si3nloong/sqlike/v2/actions"
    "github.com/si3nloong/sqlike/v2/options"
    "github.com/si3nloong/sqlike/v2/sql/expr"
)

/*
UPDATE `sqlike`.`JSON`
SET `Raw` = JSON_INSERT(
        JSON_REMOVE(`Raw`,"$._id"),
        "$.id",
        JSON_EXTRACT(`Raw`,"$._id")
    )
WHERE `ID` = 4 LIMIT 1;
*/

if affected, err := client.Database("sqlike").
    Table("JSON").
    UpdateOne(
        context.Background(),
        actions.UpdateOne().
            Where(
                expr.Equal("ID", id),
            ).
            Set(
                expr.ColumnValue("Raw",
                    expr.JSON_INSERT(
                        expr.JSON_REMOVE(expr.Column("Raw"), "$._id"),
                        "$.id",
                        expr.JSON_EXTRACT(expr.Column("Raw"), "$._id"),
                    ),
                ),
            ),
        options.UpdateOne().SetDebug(true),
); err != nil {
    panic(err)
} else if affected > 0 {
    panic("no record affected")
}
```

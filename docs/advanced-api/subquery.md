---
sidebar_position: 1
---

# Sub-query

```go
table := client.Database("sqlike").Table("Users")
result, err = table.Find(
    context.Background(),
    actions.Find().
        Where(
            expr.In("$Key", actions.Find().
                Select("$Key").
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

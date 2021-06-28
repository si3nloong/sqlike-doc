---
sidebar_position: 6
---

# Expression/Operator

```go
import (
    "github.com/si3nloong/sqlike/sql/expr"
)
```

| Function name         | Example                                                                  | SQL                                               |
| --------------------- | ------------------------------------------------------------------------ | ------------------------------------------------- |
| `expr.Raw`            | expr.Raw("\`Column\` LIKE '%ok%'")                                       | \`Column\` LIKE '%ok%'                            |
| `expr.Column`         | expr.Column("A")                                                         | \`A\`                                             |
| `expr.Equal`          | expr.Equal("Column", "value")                                            | \`Column\` = 'value'                              |
| `expr.NotEqual`       | expr.NotEqual("Column", "value")                                         | \`Column\` != 'value'                             |
| `expr.Like`           | expr.Like("Column", "value%")                                            | \`Column\` LIKE 'value%'                          |
| `expr.NotLike`        | expr.NotLike("Column", "value%")                                         | \`Column\` NOT LIKE 'value%'                      |
| `expr.In`             | expr.In("Column", []string{"A", "B", "C"})                               | \`Column\` IN ('A', 'B', 'C')                     |
| `expr.NotIn`          | expr.NotIn("Column", []string{"A", "B", "C"})                            | \`Column\` NOT IN ('A', 'B', 'C')                 |
| `expr.IsNull`         | expr.IsNull("Column")                                                    | \`Column\` IS NULL                                |
| `expr.NotNull`        | expr.NotNull("Column")                                                   | \`Column\` IS NOT NULL                            |
| `expr.GreaterThan`    | expr.GreaterThan("Column", 1)                                            | \`Column\` > 1                                    |
| `expr.GreaterOrEqual` | expr.GreaterOrEqual("Column", 1)                                         | \`Column\` >= 1                                   |
| `expr.LesserThan`     | expr.LesserThan("Column", 1)                                             | \`Column\` < 1                                    |
| `expr.LesserOrEqual`  | expr.LesserOrEqual("Column", 1)                                          | \`Column\` <= 1                                   |
| `expr.Between`        | expr.Between("Column", 1, 100)                                           | \`Column\` BETWEEN 1 AND 100                      |
| `expr.NotBetween`     | expr.NotBetween("Column", 1, 100)                                        | \`Column\` NOT BETWEEN 1 AND 100                  |
| `expr.And`            | expr.And(expr.Equal("ColumnA", "value"), expr.Equal("ColumnB", "value")) | (\`ColumnA\` = 'value' AND \`ColumnB\` = 'value') |
| `expr.Or`             | expr.Or(expr.Equal("ColumnA", "value"), expr.Equal("Column", "value"))   | (\`ColumnA\` = 'value' OR \`ColumnB\` = 'value')  |
| `expr.Increment`      | expr.Increment("Column", 2)                                              | (\`ColumnA\` + 2)                                 |
| `expr.Decrement`      | expr.Decrement("Column", 2)                                              | (\`ColumnA\` - 2)                                 |
| `expr.ColumnValue`    | expr.ColumnValue("Column", 100)                                          | SET \`Column\` = 100                              |
| `expr.Asc`            | expr.Asc("ColumnA")                                                      | \`ColumnA\` ASC                                   |
| `expr.Desc`           | expr.Desc("ColumnA")                                                     | \`ColumnA\` DESC                                  |

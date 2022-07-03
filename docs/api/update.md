---
sidebar_position: 4
---

# UPDATE

## Update Single Record

```go
import (
    "github.com/si3nloong/sqlike/v2/actions"
    "github.com/si3nloong/sqlike/v2/sql/expr"
    "context"

    _ "github.com/go-sql-driver/mysql"
)

func main() {
    result, err := client.
        Database("sqlike").
        Table("Users").
        UpdateOne(
            context.Background(),
            actions.UpdateOne().
                Where(
                    expr.Equal("ID", 123),
                ).
                Set(
                    expr.ColumnValue("Age", 18),
                ),
        )
    if err != nil {
        panic(err)
    }
}

```

## Update Single Record with Primary Key

```go
user := User{
    Name: "Sian Loong",
    Age: 18,
    Birthday: time.Now(),
}

result, err := client.
    Database("sqlike").
    Table("Users").
    ModifyOne(context.Background(), &user)
if err != nil {
    panic(err)
}
```

## Update Multiple Record

```go
import (
    "github.com/si3nloong/sqlike/v2/sqlike/actions"
    "github.com/si3nloong/sqlike/v2/sql/expr"
    "context"

    _ "github.com/go-sql-driver/mysql"
)

func main() {
    result, err := client.
        Database("sqlike").
        Table("Users").
        Update(
            context.Background(),
            actions.Update().
                Where(
                    expr.Equal("Status", "frozen"),
                ).
                Set(
                    expr.ColumnValue("Age", 18),
                ),
        )
    if err != nil {
        panic(err)
    }
}
```

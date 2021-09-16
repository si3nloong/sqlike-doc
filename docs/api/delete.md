---
sidebar_position: 5
---

# DELETE

## Delete Single Record

```go
import (
    "github.com/si3nloong/sqlike/actions"
    "github.com/si3nloong/sqlike/sql/expr"
    "context"

    _ "github.com/go-sql-driver/mysql"
)

func main() {
    result, err := client.
        Database("sqlike").
        Table("Users").
        DeleteOne(
            context.Background(),
            actions.DeleteOne().
                Where(
                    expr.Equal("ID", 123),
                ),
        )
    if err != nil {
        panic(err)
    }
}

```

## Delete Single Record using Primary Key

```go
user := User{
    Name: "Sian Loong",
    Age: 18,
    Birthday: time.Now(),
}

result, err := client.
    Database("sqlike").
    Table("Users").
    DestroyOne(context.Background(), &user)
if err != nil {
    panic(err)
}
```

## Delete Multiple Record

```go
import (
    "github.com/si3nloong/sqlike/actions"
    "github.com/si3nloong/sqlike/sql/expr"
    "context"

    _ "github.com/go-sql-driver/mysql"
)

func main() {
    result, err := client.
        Database("sqlike").
        Table("Users").
        Delete(
            context.Background(),
            actions.Delete().
                Where(
                    expr.Equal("Status", "frozen"),
                ),
        )
    if err != nil {
        panic(err)
    }
}
```

:::caution Beware

`Delete` without condition (where clause) will throw error.

:::

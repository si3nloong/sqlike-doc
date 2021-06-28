---
sidebar_position: 2
---

# SELECT

The **SELECT** statement is used to select data from a table.

## Find Single Record

Select single record from a table and map to pointer of struct.

```go
import (
    "context"
    "database/sql"
    "github.com/si3nloong/sqlike/sqlike/actions"
    "github.com/si3nloong/sqlike/sql/expr"
)

user := User{}

if err := client.Table("Users").
    FindOne(
        context.Background(),
        actions.FindOne().
            Where(
                expr.Equal("ID", "123"),
            ),
).Decode(&user); err == sql.ErrNoRows {
    // record not found
    panic(err)
} else if err != nil {
    panic(err)
}
```

:::caution Beware

If the record not found, it will throw `sql.ErrNoRows` error, remember to handle with care.

:::

## Select Multiple Record with `All`

Select multiple record from a table and map to pointer of array of struct.

```go
import (
    "context"
    "github.com/si3nloong/sqlike/sqlike/actions"
    "github.com/si3nloong/sqlike/sql/expr"
)

users := []User{}

result, err := client.Table("Users").
    Find(
        context.Background(),
        actions.Find().
            Where(
                expr.In("Status", []string{"Frozen", "Active"}),
            ),
)
if err != nil {
    panic(err)
}

if err := result.All(&users); err != nil {
    panic(err)
}
```

:::caution Beware

`Result` will close automatically once `All` is called.

:::

## Select Multiple Record with `Decode`

Select multiple record from a table and manually map it to struct.

```go
import (
    "context"
    "github.com/si3nloong/sqlike/sqlike/actions"
    "github.com/si3nloong/sqlike/sql/expr"
)

ctx := context.Background()
users := []User{}

result, err := client.Table("Users").
    Find(
        ctx,
        actions.Find().
            Where(
                expr.In("Status", []string{"Frozen", "Active"}),
            ),
)
if err != nil {
    panic(err)
}
defer result.Close()

for result.Next() {
    var user User
    if err := result.Decode(&user); err != nil {
        panic(err)
    }

    users = append(users, user)
}
```

:::danger DON'T FORGET

Remember to call `Close` once you no longer need the result, else it will lead to **memory leak**!

:::

## Pagination

### Offset pagination

### Cursor based pagination

## FAQs

I see there have a lot of similar api, such as `Scan`, `Slice`, `All` and many more, what exactly is them?

- Scan - To decode into slice of `interface{}`
- Decode - To decode into `struct`
- Slice - To decode into `[]T`
- All - To decode into `[]T`

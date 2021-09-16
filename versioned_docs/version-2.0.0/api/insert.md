---
sidebar_position: 3
---

# INSERT

## Insert Single Record

```go
import (
    "context"
    "time"
)

user := User{
    Name: "Sian Loong",
    Age: 18,
    Birthday: time.Now(),
}

result, err := client.
    Database("sqlike").
    Table("Users").
    InsertOne(context.Background(), &user)
if err != nil {
    panic(err)
}
```

## Insert Multiple Record

```go
import (
    "context"
    "time"
)

users := []User{
    User{
        ID: 1,
        Name: "Sian Loong",
        Age: 18,
        Birthday: time.Now(),
    },
    User{
        ID: 2,
        Name: "John Doe",
        Age: 26,
        Birthday: time.Now(),
    },
}

result, err := client.
    Database("sqlike").
    Table("Users").
    Insert(context.Background(), &users)
if err != nil {
    panic(err)
}
```

## Upsert Single Record

> If record found, replace old record, else add as new record.

```go
import (
    "context"
    "time"
    "github.com/si3nloong/sqlike/v2/options"
)

user := User{
    Name: "Sian Loong",
    Age: 18,
    Birthday: time.Now(),
}

result, err := client.
    Database("sqlike").
    Table("Users").
    InsertOne(
        context.Background(),
        &user,
        options.InsertOne().
            SetMode(options.InsertOnDuplicate))
    )
if err != nil {
    panic(err)
}
```

## Insert Ignore Single Record

> If record found, skip it, else add as new record.

```go
import (
    "context"
    "time"
    "github.com/si3nloong/sqlike/v2/options"
)

user := User{
    Name: "Sian Loong",
    Age: 18,
    Birthday: time.Now(),
}

result, err := client.
    Database("sqlike").
    Table("Users").
    InsertOne(
        context.Background(),
        &user,
        options.InsertOne().
            SetMode(options.InsertIgnore))
    )
if err != nil {
    panic(err)
}
```

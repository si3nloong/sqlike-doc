---
sidebar_position: 7
---

# Transaction

### Handle transaction manually

```go
import (
    "context"

    "github.com/si3nloong/sqlike/v2"
    "github.com/si3nloong/sqlike/v2/actions"
    "github.com/si3nloong/sqlike/v2/sql/expr"
)

ctx := context.Background()
tx, err := db.BeginTransaction(ctx)
if err != nil {
    panic(err)
}

if err := db.Table("Users").FindOne(
    tx,
    actions.FindOne().
        Where(
            expr.Equal("ID", "123"),
        ),
).Decode(&User{}); err != nil {
    // rollback transaction once it hit error
    tx.RollbackTransaction()
    panic(err)
}

// commit transaction
tx.CommitTransaction()
```

### Handle transaction within scope

> Transaction will proceed if `error` return from scope is `nil`, else it will rollback.

```go
import (
    "context"

    "github.com/si3nloong/sqlike/v2"
    "github.com/si3nloong/sqlike/v2/actions"
    "github.com/si3nloong/sqlike/v2/options"
    "github.com/si3nloong/sqlike/v2/sql/expr"
)

user := User{}

client.RunInTransaction(
    context.Background(),
    func(sess sqlike.SessionContext) error {
        if err := db.Table("Users").FindOne(
            sess,
            actions.FindOne().
                Where(
                    expr.Equal("ID", "123"),
                ),
            options.FindOne().
                SetLockMode(options.LockForUpdate),
        ).Decode(&user); err != nil {
            return err
        }
        return nil
    },
)
```

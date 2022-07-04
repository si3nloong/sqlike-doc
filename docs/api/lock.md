---
sidebar_position: 8
---

# Table Locking

> A lock is a mechanism associated with a table used to restrict the unauthorized access of the data in a table. Table locking is to prevent it from unauthorized modification into the same table during a specific period.

```go
import (
    "context"
    "database/sql"
    "github.com/si3nloong/sqlike/v2/actions"
    "github.com/si3nloong/sqlike/v2/options"
    "github.com/si3nloong/sqlike/v2/sql/expr"
)

tx, err := db.BeginTransaction(ctx)
if err != nil {
    panic(err)
}

if err := client.Table("Users").
    FindOne(
        tx,
        actions.FindOne().
            Where(
                expr.Equal("ID", "123"),
            ),
        options.FindOne().
            SetLockMode(options.LockForUpdate),
).Decode(&user); err == sql.ErrNoRows {
    // record not found
    panic(err)
} else if err != nil {
    panic(err)
}
```

```go
import (
    "context"

    "github.com/si3nloong/sqlike/v2/actions"
    "github.com/si3nloong/sqlike/v2/options"
    "github.com/si3nloong/sqlike/v2/sql/expr"
)

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

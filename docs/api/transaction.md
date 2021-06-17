---
sidebar_position: 5
---

# Transaction

### Handle transaction manually

```go


```

### Handle transaction within scope

> Transaction will proceed if `error` return from scope is `nil`, else it will rollback.

```go
user := User{}

client.RunInTransaction(
    context.Background(),
    func(sess sqlike.SessionContext) error {
        if err := sess.Table("Users").FindOne(
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

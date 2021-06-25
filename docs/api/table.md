---
sidebar_position: 1
---

# Table Migration

```go
client.Database("sqlike").
    Table("Users").
    MustMigrate(User{})
```

# Truncate table records

```go
client.Database("sqlike").
    Table("Users").
    Truncate(context.Background())
```

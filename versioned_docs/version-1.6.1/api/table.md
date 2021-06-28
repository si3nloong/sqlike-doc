---
sidebar_position: 1
---

# Table and Migration

## CREATE/ALTER table

### Without dropping existing indexes and columns

```go
import (
    "time"
    "golang.org/x/text/language"
    "github.com/paulmach/orb"
    "cloud.google.com/go/civil"
)

type User struct{
    Name            string `sqlike:",size=100"`
    Age             uint
    Detail struct{
        FirstName   string
        Address     string
    }
    Address         string  `sqlike:",longtext"`
    Money           float64 `sqlike:",unsigned"`
    FavouriteFoods  []string
    ChosenLanguage  language.Tag
    Birthday        civil.Date
    Geolocation     orb.Point
    JoinAt          time.Time
}

db := client.Database("sqlike")

db.Table("Users").MustMigrate(User{})
// or
db.Table("Users").Migrate(User{})
```

### Drop existing indexes and columns if they no longer available

```go
db.Table("Users").UnsafeMigrate(User{})
```

## Drop table

```go
client.Database("sqlike").
    Table("Users").
    Drop(context.Background())
```

## Drop table if exists

```go
client.Database("sqlike").
    Table("Users").
    DropIfExists(context.Background())
```

## Rename table

```go
client.Database("sqlike").
    Table("Users").
    Rename(context.Background(), "newUsers")
```

## Truncate table records

```go
client.Database("sqlike").
    Table("Users").
    Truncate(context.Background())
```

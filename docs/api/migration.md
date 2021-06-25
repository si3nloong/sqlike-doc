<!-- ---
sidebar_position: 1
---

# Migration

```go
import (
    "time"
    "golang.org/x/text/language"
    "github.com/paulmach/orb"
    "cloud.google.com/go/civil"
)

type User struct{
    Name            string
    Detail struct{
        FirstName   string
        Address     string
    }
    FavouriteFoods  []string
    ChosenLanguage  language.Tag
    Birthday        civil.Date
    Geolocation     orb.Point
    JoinAt          time.Time
}

func main() {
    client.Database("sqlike").
        Table("Users").
        MustMigrate(User{})
}

``` -->

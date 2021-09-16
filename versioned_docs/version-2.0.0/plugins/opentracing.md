---
sidebar_position: 1
---

# OpenTracing

```go
import (
    "context"
    "github.com/go-sql-driver/mysql"
    "github.com/si3nloong/sqlike/v2/plugin/opentracing"
    "github.com/si3nloong/sqlike/v2/sql/instrumented"

    "github.com/si3nloong/sqlike"
)

func main() {
    ctx := context.Background()
    driver := "mysql"
    cfg := mysql.NewConfig()
    cfg.User = "root"
    cfg.Passwd = "abcd1234"
    cfg.ParseTime = true
    conn, err := mysql.NewConnector(cfg)
    if err != nil {
        panic(err)
    }

    itpr := opentracing.NewInterceptor(
        opentracing.WithDBInstance("sqlike"),
        opentracing.WithDBUser(cfg.User),
        opentracing.WithExec(true),
        opentracing.WithQuery(true),
    )
    client, err := sqlike.ConnectDB(
        ctx,
        driver,
        instrumented.WrapConnector(conn, itpr),
    )
    if err != nil {
        panic(err)
    }
    defer client.Close()
}
```

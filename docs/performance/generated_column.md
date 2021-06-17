---
sidebar_position: 2
---

# Secondary Indexes and Generated Columns

InnoDB supports secondary indexes on virtual generated columns. Other index types are not supported. A secondary index defined on a virtual column is sometimes referred to as a “virtual index”.

A secondary index may be created on one or more virtual columns or on a combination of virtual columns and regular columns or stored generated columns. Secondary indexes that include virtual columns may be defined as UNIQUE.

- [Stored Columns](./generated_column.md#stored-columns)
- [Virtual columns](./generated_column.md#virtual-columns)

## Stored Columns

Use keyword `stored_column` in field tag to let **sqlike** create stored column for your table column.

```go
type User struct{
    Detail struct{
        FirstName   string `sqlike:",stored_column=Username"`
        LastName    string
    }
    Username string `sqlike:",generated_column"`
}

func main() {
    client.Database("sqlike").
        Table("users").
        MustMigrate(User{})
}
```

## Virtual Columns

Use keyword `virtual_column` in field tag to let **sqlike** create virtual column for your table column.

```go
type User struct{
    Detail struct{
        FirstName   string `sqlike:",virtual_column=Username"`
        LastName    string
    }
    Username string `sqlike:",generated_column"`
}

func main() {
    client.Database("sqlike").
        Table("users").
        MustMigrate(User{})
}
```

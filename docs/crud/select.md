---
sidebar_position: 1
---

# SELECT

## Insert Single Record

```go
user := User{
    Name: "Sian Loong",
    Age: 18,
    Birthday: time.Now(),
}

result, err := client.
    Database("sqlike").
    Table("users").
    InsertOne(context.Background(), &user)
if err != nil {
    panic(err)
}
```

## Insert Multiple Record

```go
users := []User{
    Name: "Sian Loong",
    Age: 18,
    Birthday: time.Now(),
}

result, err := client.
    Database("sqlike").
    Table("users").
    Insert(context.Background(), &users)
if err != nil {
    panic(err)
}
```

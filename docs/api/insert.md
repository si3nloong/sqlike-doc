---
sidebar_position: 3
---

# INSERT

## Insert Single Record

```go
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
users := []User{
    Name: "Sian Loong",
    Age: 18,
    Birthday: time.Now(),
}

result, err := client.
    Database("sqlike").
    Table("Users").
    Insert(context.Background(), &users)
if err != nil {
    panic(err)
}
```

---
sidebar_position: 1
---

# Model

Value after prefix of `sqlike` always a column name. To define multiple tag value, you can use **comma** to seperate them.

| Field Tag          | Value Required | Value Data Type | Description                                                  |
| ------------------ | -------------- | --------------- | ------------------------------------------------------------ |
| `-`                | no             | -               | skip this field                                              |
| `size`             | yes            | `integer`       | set column length                                            |
| `comment`          | yes            | `string`        | set column comment                                           |
| `primary_key`      | no             | -               | set column as primary key                                    |
| `generated_column` | no             | -               | column length                                                |
| `virtual_column`   | no             | `string`        | make column as virtual column                                |
| `stored_column`    | no             | `string`        | make column as stored column                                 |
| `charset`          | yes            | `string`        | set column character set                                     |
| `collate`          | yes            | `string`        | set column collation                                         |
| `auto_increment`   | no             | -               | set column as auto increment, mainly for primary key purpose |
| `set`              | yes            | `[]string`      | set column to `SET` data type and available values           |
| `enum`             | yes            | `[]string`      | set column to `ENUM` data type and available values          |
| `longtext`         | no             | -               | set column to `LONGTEXT` data type                           |
| `unsigned`         | no             | -               | set column to unsigned (Only applicable to number data type) |
| `default`          | yes            | `any`           | set column default value                                     |

## Example

```go
type User struct{
    ID       int64   `sqlike:",primary_key,auto_increment"`
    FullName string  `sqlike:",generated_column"`
    Detail struct{
        FirstName string `sqlike:",stored_column=FullName"`
    }
    Money    float64 `sqlike:",unsigned"`
    Address  string  `sqlike:",longtext"`
    Email    string  `sqlike:",size=100"`
    Status   string  `sqlike:",enum=Frozen|IDLE"`
}
```

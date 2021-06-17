---
sidebar_position: 1
---

# Index

- [Unique Indexes](./index.md#unique-indexes)
- [Full-Text Indexes](./index.md#full-text-indexes)
- [Spatial Indexes](./index.md#spatial-indexes)
- [Multi-Valued Indexes](./index.md#multi-valued-indexes)
- Function Index

## Unique Indexes

```yaml title="index.yaml"
# primary key
- table: User
  type: primary
  columns:
    - name: ID

# unique index
- table: User
  type: unique
  columns:
    - name: Email
```

## Full-Text Indexes

```yaml title="index.yaml"
# Index `Name` column with descending order
- table: User
  columns:
    - name: Name
      direction: desc
  comment: "User's full name"
```

## Spatial Indexes

```yaml title="index.yaml"
- table: User
  type: spatial
  columns:
    - name: Location
```

## Multi-Valued Indexes

```yaml title="index.yaml"
- table: User
  type: spatial
  columns:
    - name: Location
```

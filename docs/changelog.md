---
sidebar_position: 6
---

# Changelog

## v2.0.0

- Refactor folders, move some resources into **internal** folder.
- Rework `sqlike.SessionContext` in `RunInTransaction` API.
- Rework `DataType` interface, it's now called `ColumnDataTyper` and accept different arguments.
- Support multiple tag for struct reflection, right now it supports `db`, `sqlike` and `sql` tag.
- Drop custom type `types.Date`, replace it with `civil.Date` instead.
- Support [multi-valued indexes](<https://dev.mysql.com/doc/refman/8.0/en/create-index.html#:~:text=A%20multi%2Dvalued%20index%20is,record%20(N%3A1).>).
- Support **foreign key**.
- Warn user when they're using **MySQL 5.7**.
- Rework encoder, `driver.Valuer` not allow to pass **Spatial** nor **JSON** value, eg : **(ST_GeomFromText('POINT(1 1)'))**.
- Rework Lock API, since mysql 8.0 support [skip lock](https://dev.mysql.com/blog-archive/mysql-8-0-1-using-skip-locked-and-nowait-to-handle-hot-rows/).
- Support **JOIN** clause, including **LEFT JOIN**, **INNER JOIN**.
- Rework `Pagination` API.
- Support Generic (go v1.18).

---
sidebar_position: 3
---

# Spatial

```go
import (
    "context"
    "github.com/paulmach/orb"
    "github.com/si3nloong/sqlike/sqlike/actions"
    "github.com/si3nloong/sqlike/sql/expr"
)

/*
    SELECT
        ST_Distance(`Point`,ST_PointFromText("POINT(20 10)")) AS `dist`,
        ST_Distance(ST_GeomFromText("POINT(1 3)",4326),ST_GeomFromText("POINT(4 18)",4326)),ST_AsText(`Point`)
    FROM `sqlike`.`Locations`
    WHERE (
        `ID` = 1 AND
        ST_Equals(ST_PointFromText("POINT(20 10)"),ST_PointFromText("POINT(20 10)"))
    )
    ORDER BY `dist` DESC LIMIT 1;
*/

var o struct {
    Dist1 float64
    Dist2 float64
    Text  string
}

if err := client.Database("sqlike")
    Table("Locations").
    FindOne(
        context.Background(),
        actions.FindOne().
            Select(
                expr.As(expr.ST_Distance(expr.Column("Point"), orb.Point{20, 10}), "dist"),
                expr.ST_Distance(
                    expr.ST_GeomFromText(orb.Point{1, 3}, 4326),
                    expr.ST_GeomFromText(orb.Point{4, 18}, 4326),
                ),
                expr.ST_AsText(expr.Column("Point")),
            ).
            Where(
                expr.Equal("ID", 1),
                expr.ST_Equals(orb.Point{20, 10}, orb.Point{20, 10}),
            ).
            OrderBy(
                expr.Desc("dist"),
            ),
).Scan(&o.Dist1, &o.Dist2, &o.Text); err != nil {
    panic(err)
}
```

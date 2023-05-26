const expect = @import("std").testing.expect;

const Point = struct { x: f32, y: f32 };

// order is preserved
const PackedPoint = packed struct { x: f32, y: f32 };

var p = Point{
    .x = 0.12,
    .y = 0.34,
};

const Vect = struct {
    x: f32,
    y: f32,
    z: f32,

    pub fn init(x: f32, y: f32, z: f32) Vect {
        return Vect{
            .x = x,
            .y = y,
            .z = z,
        };
    }

    pub fn dot(self: Vect, other: Vect) f32 {
        return self.x * other.x + self.y * other.y + self.z * other.z;
    }
};

test "dot product" {
    const v1 = Vect.init(1.0, 0.0, 0.0);
    const v2 = Vect.init(0.0, 1.0, 0.0);
    try expect(v1.dot(v2) == 0);
}

const Empty = struct {
    pub const PI = 3.14;
};

test "empty struct" {
    try expect(Empty.PI == 3.14);
}

const Foo = struct {
    a: i32 = 1234,
    b: i32,
};

test "default values in struct" {
    const x = Foo{
        .b = 5,
    };
    try expect(x.a + x.b == 1239);
}

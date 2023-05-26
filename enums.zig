const expect = @import("std").testing.expect;

const Type = enum {
    ok,
    not_ok,
};

const c = Type.ok;

const Color = enum {
    auto,
    on,
    off,
};

test "enum literals" {
    const c1: Color = .auto;
    const c2: Color = .on;
    try expect(c1 != c2);
}

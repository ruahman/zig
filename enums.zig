const print = @import("std").debug.print;

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

pub fn main() void {
    const c1: Color = .auto;
    const c2: Color = .on;
    print("c1: {}\n", .{c1});
    print("c2: {}\n", .{c2});
}

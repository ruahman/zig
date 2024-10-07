const std = @import("std");

pub fn main() void {
    const res = sumOfTwo(10, 5);
    std.debug.print("hello {s} {}\n", .{ "world", res });
}

fn sumOfTwo(a: i32, b: i32) i32 {
    return a + b;
}

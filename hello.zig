const std = @import("std");

fn sumOfTwo(a: i32, b: i32) i32 {
    return a + b;
}

test "hello" {
    var v: u32 = 5000;
    v = 5555;
    const res = sumOfTwo(10, 5);
    const infer = @as(i32, 5000);
    // zig does not have a string type
    const string: []const u8 = "diego vila";
    std.debug.print("hello {s} {} {} {} {s}\n", .{ "world", res, v, infer, string });
}

pub fn main() void {
    std.debug.print("run test `zig test hello.zig`", .{});
}

const std = @import("std");
const expectEqual = std.testing.expectEqual;

test "Basic vector" {
    const a = @Vector(4, i32){ 1, 2, 3, 4 };
    const b = @Vector(4, i32){ 5, 6, 7, 8 };
    std.debug.print("a: {}\n", .{a});
    std.debug.print("b: {}\n", .{b});
    const c = a + b;
    std.debug.print("c: {}\n", .{c});
    try expectEqual(6, c[0]);
    try expectEqual(8, c[1]);
    try expectEqual(10, c[2]);
}

const std = @import("std");
test "print arrays" {
    const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };

    // infer type
    const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' };

    std.debug.print("a.len: {d}", .{b.len});
    std.debug.print("b.len: {d}", .{a.len});

    // slices
    const array = [_]i32{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];

    for (array) |val| {
        std.debug.print("array: {}\n", .{val});
    }

    for (slice) |val| {
        std.debug.print("slice: {}\n", .{val});
    }
}

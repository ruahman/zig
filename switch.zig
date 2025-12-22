const std = @import("std");

test "switch" {
    const day = 3;
    switch (day) {
        1 => std.debug.print("monday\n", .{}),
        2 => std.debug.print("tuesday\n", .{}),
        3, 4 => std.debug.print("wednsay\n", .{}),
        5...10 => std.debug.print("between 5 and 10", .{}),
        else => std.debug.print("any other day\n", .{}),
    }

    const output = switch (day) {
        0 => 123,
        3 => 44,
        11 => |val| blk: {
            break :blk val + 25;
        },
        else => 666,
    };

    std.debug.print("output: {}\n", .{output});
}

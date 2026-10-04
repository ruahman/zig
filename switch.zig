const std = @import("std");
const expect = @import("std").testing.expect;

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

test "switch statement" {
    var x: i8 = 10;
    switch (x) {
        -1...1 => {
            x = -x;
        },
        10, 100 => {
            //special considerations must be made
            //when dividing signed integers
            x = @divExact(x, 10);
        },
        else => {},
    }
    try expect(x == 1);
}

test "switch expression" {
    var x: i8 = 10;
    x = switch (x) {
        -1...1 => -x,
        10, 100 => @divExact(x, 10),
        else => x,
    };
    try expect(x == 1);
}

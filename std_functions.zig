pub fn main() void {
    const number: u8 = 65;

    // formate string, tuple of values
    // default specifier
    @import("std").debug.print("Number: {}\n", .{number});

    // decimal specifier
    @import("std").debug.print("Number: {d}\n", .{number});

    // hex decimal
    @import("std").debug.print("Number: {x}\n", .{number});

    // octav
    @import("std").debug.print("Number: {o}\n", .{number});

    // binary
    @import("std").debug.print("Number: {b}\n", .{number});

    // character
    @import("std").debug.print("Number: {c}\n", .{number});

    // string
    @import("std").debug.print("String: {s}\n", .{"hello world"});

    // optional ?

    // any is default

    // just like print but don't need \n
    @import("std").log.debug("Debug message", .{});
    @import("std").log.warn("Warn message", .{});
    @import("std").log.info("Info message", .{});
    @import("std").log.err("Err message", .{});

    // comp
    const array1: [3]u8 = [3]u8{ 2, 5, 7 };
    const array2: [3]u8 = [3]u8{ 2, 5, 7 };
    const res: bool = @import("std").mem.eql(u8, &array1, &array2);
    @import("std").debug.print("Arrays are equal: {}", .{res});
}

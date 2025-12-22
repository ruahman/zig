const std = @import("std");
const expect = std.testing.expect;

test "if statement" {
    const a = true;
    var x: u16 = 0;
    if (a) {
        x += 1;
    } else {
        x += 2;
    }
    try expect(x == 1);
    std.debug.print("if statements work\n", .{});

    // if statments for optional variables
    const optional_var1: ?u8 = null;
    const optional_var2: ?u8 = 8;

    if (optional_var1) |val| {
        std.debug.print("val: {}\n", .{val});
    }
    if (optional_var2) |val| {
        std.debug.print("val: {}\n", .{val});
    }

    // if you want to return a value from if
    // you need to label the block
    const num1 = 5;
    const if_value = if (num1 == 5) if_label: {
        break :if_label 24;
    } else 0;
    std.debug.print("if_value: {}\n", .{if_value});

    // you can do this for errors also
    // const myerror = error.SomeError;
    // if (myerror) |val| {
    //     std.debug.print("error: {}", .{val});
    // }
}

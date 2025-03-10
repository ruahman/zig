const constants: i32 = 5;
var variables: u32 = 5000;

const inferred_constant = @as(i32, 5);
var inferred_variable = @as(u32, 5000);

const std = @import("std");
test "print assignments" {
    std.debug.print("constants: {d}\n", .{constants});
    std.debug.print("constants: {d}\n", .{variables});
    std.debug.print("inferred_constant: {d}\n", .{inferred_constant});
    std.debug.print("inferred_variable: {d}\n", .{inferred_variable});
}

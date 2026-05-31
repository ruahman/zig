
const std = @import("std");

test "tuples" {
    const myTuple = .{
        42,
        "Hello",
        3.14
    };

    const intValue : i32 = myTuple[0];
    const stringValue : []const u8 = myTuple[1];
    const floatValue : f64 = myTuple[2];

    std.debug.print("interger: {d}, string: {s}, float: {d:.2}\n", .{intValue, stringValue, floatValue});
    std.debug.print("interger: {d}, string: {s}, float: {d:.2}\n", myTuple);
}
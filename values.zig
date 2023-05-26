const std = @import("std");
const print = std.debug.print;
const os = std.os;
const assert = std.debug.assert;

pub fn main() void {
    const one_plus_one: i32 = 1 + 1;
    print("1 + 1 = {}\n", .{one_plus_one});

    const seven_div_three: f32 = 7 / 3;
    print("7 / 3 = {}\n", .{seven_div_three});

    print("{}\n{}\n{}\n", .{ true and false, true or false, !true });

    var optional_value: ?u8 = null;
    assert(optional_value == null);

    var number_or_error: anyerror!i32 = error.ArgNotFountd;

    print("\n type: {s}\nvalue: {any}\n", .{ @typeName(@TypeOf(number_or_error)), number_or_error });

    const bytes = "hello";
    print("\n{s}\n", .{@typeName(@TypeOf(bytes))});
    print("{d}\n", .{bytes.len});
    print("{c}\n", .{bytes[0]});
}

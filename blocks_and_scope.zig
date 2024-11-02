const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    {
        const x = "Im in the block";
        print("x: {s}\n", .{x});
    }

    // this would break
    // print("x: {s}\n", .{x});
}

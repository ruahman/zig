const std = @import("std");
const print = std.debug.print;

var count: u32 = 0;

pub fn main() void {
    while (count < 5) {
        print("count: {}\n", .{count});
        count += 1;
    }
}

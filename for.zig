const std = @import("std");
const print = std.debug.print;

const items = [_]u32{ 1, 2, 3, 4, 5 };

pub fn main() void {
    for (items) |item| {
        print("item: {}\n", .{item});
    }
}

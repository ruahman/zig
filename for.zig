const std = @import("std");
const print = std.debug.print;

const items = [_]u32{ 1, 2, 3, 4, 5 };

test "for" {
    for (items) |item| {
        print("item: {}\n", .{item});
    }
    for (0..5) |i| {
        print("i: {}\n", .{i});
    }
    for (items, 0..) |val, idx| {
        print("val: {}, idx: {}\n", .{ val, idx });
    }
}

pub fn main() void {
    print("zig test for.zig\n", .{});
}

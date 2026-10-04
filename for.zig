const std = @import("std");
const print = std.debug.print;
const expect = @import("std").testing.expect;

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

test "for 2" {
    //character literals are equivalent to integer literals
    const string = [_]u8{ 'a', 'b', 'c' };

    for (string, 0..) |character, index| {
        _ = character;
        _ = index;
    }

    for (string) |character| {
        _ = character;
    }

    for (string, 0..) |_, index| {
        _ = index;
    }

    for (string) |_| {}
}

pub fn main() void {
    print("zig test for.zig\n", .{});
}

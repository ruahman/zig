const std = @import("std");
const print = std.debug.print;

var count: u32 = 0;

test "while " {
    while (count < 15) {
        print("count: {}\n", .{count});
        count += 1;
    }
    while (count < 30) : (count += 1) {
        print("count: {}\n", .{count});
    }
    while (true) {
        if (count > 45) {
            break;
        }
        print("count: {}\n", .{count});
        count += 1;
    }
}

pub fn main() void {
    print("zig test while\n", .{});
}

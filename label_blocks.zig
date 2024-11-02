const print = @import("std").debug.print;

pub fn main() void {
    outer: {
        for ([_]u32{ 1, 2, 3 }) |i| {
            for ([_]u32{ 4, 5, 6 }) |j| {
                if (i + j == 7) {
                    print("break out if 7\n", .{});
                    break :outer;
                }
            }
        }
    }
}

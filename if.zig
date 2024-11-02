const std = @import("std");
const print = std.debug.print;

const score = 85;

pub fn main() void {
    if (score >= 90) {
        print("Grade A\n", .{});
    } else if (score >= 80) {
        print("Grade B\n", .{});
    } else {
        print("Grade C", .{});
    }
}

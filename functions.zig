const std = @import("std");
const print = std.debug.print;

fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub fn main() void {
    const result = add(2, 3);
    print("result: {}\n", .{result});
}

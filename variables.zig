const std = @import("std");

const maxitems = 100;
const age: u32 = 25;

pub fn main() void {
    var count: i32 = 10;
    count += 1;
    const height: f32 = 5.9;
    const isStudent: bool = true;
    const letter: u8 = 'A';
    const name = "hello zig";

    std.debug.print("count: {}\n", .{count});
    std.debug.print("maxitems: {}\n", .{maxitems});
    std.debug.print("age: {}\n", .{age});
    std.debug.print("height: {}\n", .{height});
    std.debug.print("isStudent: {}\n", .{isStudent});
    std.debug.print("A: {}\n", .{letter});
    std.debug.print("name: {s}\n", .{name});
}

// standard library
const std = @import("std");

test "hello world" {
    std.debug.print("test hello world\n", .{});
}

// entry point
pub fn main() void {
    // second parameter is a tuple
    std.debug.print("Hello, {s}!\n", .{"world"});
    std.debug.print("Hello, {s}!\n", .{"World"});
}

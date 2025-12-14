const std = @import("std");

const print = std.debug.print;

test "test common_standard_libary_functions" {
    const number: u8 = 65;
    print("Number: {}\n", .{number}); // print in default way
    print("Number (d): {d}\n", .{number}); // print in decimal notation
    print("Number (x): {x}\n", .{number}); // print in hex
    print("Number (o): {o}\n", .{number}); // print in octal
    print("Number (b): {b}\n", .{number}); // print in binary
    print("Number (c): {c}\n", .{number}); // print in char
    print("String: {s}\n", .{"hello world"}); // print in string

    // set log level to .debug
    std.testing.log_level = .debug;

    // don't neet new line
    std.log.debug("debug message", .{});
    std.log.warn("warn message", .{});
    std.log.info("info message", .{});
}

pub fn main() void {
    print("if you want to set the tests run `zig test common_standard_libary_functions.zig\n", .{});

    // don't need a new line
    std.log.debug("debug message", .{});
    std.log.warn("warn message", .{});
    std.log.info("info message", .{});
    std.log.err("err message", .{});
}

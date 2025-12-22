//! this is a top level comment comment
//!
//!

const std = @import("std");
const expect = std.testing.expect;
const hellow = @import("./import_func.zig").hellow;

const print = std.debug.print;

/// this is a document comment: public functions can be exported and used by other files
pub fn addNumbers(num1: u8, num2: u8) u16 {
    return num1 + num2;
}

fn greet() void {
    print("greeting\n", .{});
}

fn greet_name(name: []const u8) void {
    print("greet: {s}\n", .{name});
}

inline fn square(x: i32) i32 {
    return x * x;
}

fn divide(a: i32, b: i32) !i32 {
    if (b == 0) {
        return error.DivisionByZero;
    }
    return @divExact(a, b);
}

const GreatArgs = struct {
    name: []const u8,
    age: u32 = 0,
};

fn greet_args(args: GreatArgs) void {
    if (args.age != 0) {
        print("name: {s}, age: {}\n", .{ args.name, args.age });
    } else {
        print("name: {s}\n", .{args.name});
    }
}

fn applyOperation(a: u8, b: u8, operation: fn (u8, u8) u16) i32 {
    return operation(a, b);
}

const multiply = struct {
    fn call(a: i32, b: i32) i32 {
        return a * b;
    }
};

test "test functions" {
    const resAddNumbers = addNumbers(2, 3);
    print("resAddNumbers: {}\n", .{resAddNumbers});
    greet();
    greet_name("Diego");
    const resSquare = square(2);
    print("resSquare: {}\n", .{resSquare});
    const value = divide(10, 2);
    if (value) |val| {
        print("value: {}\n", .{val});
    } else |err| {
        print("err: {}\n", .{err});
    }
    greet_args(.{ .name = "Diego", .age = 43 });
    greet_args(.{ .name = "Andy" });
    const applyRes = applyOperation(2, 3, addNumbers);
    print("applyRes: {}\n", .{applyRes});
    const res3 = multiply.call(3, 2);
    print("res3: {}\n", .{res3});

    hellow();
}

pub fn main() void {
    print("this program shows how functions work in zig\n", .{});
    print("to see the tests for functions run `zig test functions.zig`\n", .{});
}

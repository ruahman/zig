//! this is a top level comment comment
//!
//!

const std = @import("std");
const print = std.debug.print;

fn add(a: i32, b: i32) i32 {
    return a + b;
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

fn applyOperation(a: i32, b: i32, operation: fn (i32, i32) i32) i32 {
    return operation(a, b);
}

/// this is a document comment: public functions can be exported and used by other files
pub fn addNumbers(num1: u8, num2: u8) u16 {
    return num1 + num2;
}

pub fn main() void {
    const result = add(2, 3);
    print("result: {}\n", .{result});
    greet();
    greet_name("Diego");
    const res2 = square(2);
    print("res2: {}\n", .{res2});
    const value = divide(10, 2);
    if (value) |val| {
        print("value: {}\n", .{val});
    } else |err| {
        print("err: {}\n", .{err});
    }
    const value2 = divide(10, 0);
    if (value2) |val| {
        print("value2: {}\n", .{val});
    } else |err| {
        print("err: {}\n", .{err});
    }
    greet_args(.{ .name = "Diego", .age = 43 });
    greet_args(.{ .name = "Andy" });
    const applyRes = applyOperation(2, 3, add);
    print("applyRes: {}\n", .{applyRes});

    const multiply = struct {
        fn call(a: i32, b: i32) i32 {
            return a * b;
        }
    };

    const res3 = multiply.call(3, 2);
    print("res3: {}\n", .{res3});

    const number1: u8 = 5;
    var number2: u8 = 10;
    number2 = 15;

    // arguments is a string, and a tuple of variables
    @import("std").debug.print("number1: {}, number2: {}\n", .{ number1, number2 });

    // you can create a new type with const
    const Unsigned16BitInteger = u16;
    const sum_of_integers: Unsigned16BitInteger = addNumbers(number1, number2);
    _ = sum_of_integers;
}

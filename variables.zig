const std = @import("std");

const print = std.debug.print;

test "test variables" {
    // const is imutable
    // if you dont use a variable that you declair zig will complain
    const number1: u8 = 5;

    // zig can infer the type
    const const_number = 55;
    // so zig doesn't complain about const_nuber not being used
    _ = const_number;

    // some random name for variable
    const @"123 foobar" = 123;
    print("random name: {}\n", .{@"123 foobar"});

    // if you try to set a const variable zig will complain
    // number1 = 5;

    // var is mutable
    // if you dont update a mutable variable zig will complain
    var number2: u8 = 10;
    number2 = number2 + number1;
    @import("std").debug.print("Number 2: {}\n", .{number2});
    var mut_bool = true;
    mut_bool = false;

    var count: i32 = 10;
    count += 1;

    // an optional variable
    const optional: ?u8 = null;
    print("optional: {?}\n", .{optional});

    const isStudent: bool = true;
    const height: f32 = 5.9;
    const letter: u8 = 'A';
    const name = "hello zig";

    std.debug.print("count: {}\n", .{count});
    std.debug.print("height: {}\n", .{height});
    std.debug.print("isStudent: {}\n", .{isStudent});
    std.debug.print("A: {}\n", .{letter});
    std.debug.print("name: {s}\n", .{name});

    // custom type
    const CustomType = u8;
    const test_cust: CustomType = 8;
    std.debug.print("CustomType: {}\n", .{test_cust});
}

pub fn main() void {
    std.debug.print("to run test run `zig test variables.zig\n", .{});
}

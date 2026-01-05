const std = @import("std");

const expect = std.testing.expect;
const print = std.debug.print;

fn incrementNumber(input: *u8) void {
    input.* += 1;
}

const Point = struct { x: u8, y: u8 };

test "adddress syntax" {
    const x: i32 = 1234;
    const x_ptr = &x;
    try expect(x_ptr.* == 1234);
    try expect(@TypeOf(x_ptr) == *const i32);
    var y: i32 = 5678;
    const y_ptr = &y;
    try expect(@TypeOf(y_ptr) == *i32);
    y_ptr.* += 1;
    try expect(y_ptr.* == 5679);
    var number1: u8 = 153;
    const number1_ptr: *u8 = &number1;
    const number1_ptr_address: usize = @intFromPtr(number1_ptr);
    print("number1: {}\n", .{number1});
    print("number1_ptr: {}\n", .{number1_ptr.*});
    print("number1_ptr_address: {}\n", .{number1_ptr_address});

    incrementNumber(&number1);
    print("number1 after increment: {}\n", .{number1});

    // to point to a const variable you need a const pointer type
    // but the pointer varaible can be mutalbe
    const number2: u8 = 100;
    const number2_ptr: *const u8 = &number2;
    print("number2_ptr: {}", .{number2_ptr.*});
    print("type of number1_ptr: {}\n", .{@TypeOf(number1_ptr)});
    print("type of number2_ptr: {}\n", .{@TypeOf(number2_ptr)});

    // you don't need to deref a pointer to a struct
    const origin: Point = Point{ .x = 0, .y = 0 };
    const origin_ptr: *const Point = &origin;
    print("origin: ({},{})\n", .{ origin_ptr.*.x, origin_ptr.x });

    // array pointers
    var arr1 = [6]u8{ 3, 1, 4, 1, 5, 9 };
    const arr1_ptr: [*]u8 = &arr1;
    const arr2 = [_]u8{ 1, 2, 3 };
    const arr2_ptr: [*]const u8 = &arr2;
    print("arr1 item: {}\n", .{arr1_ptr[0]});
    print("arr2 item: {}\n", .{arr2_ptr[0]});
}

test "array access" {
    var array = [_]u8{ 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    const ptr = &array[2];
    try expect(@TypeOf(ptr) == *u8);
    ptr.* += 1;
    try expect(array[2] == 4);
}

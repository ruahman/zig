const std = @import("std");
const expect = std.testing.expect;

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
}

test "array access" {
    var array = [_]u8{ 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    const ptr = &array[2];
    try expect(@TypeOf(ptr) == *u8);
    ptr.* += 1;
    try expect(array[2] == 4);
}

const std = @import("std");

const print = std.debug.print;

test "slice" {
    var arr1 = [6]u8{ 3, 1, 4, 1, 5, 9 };
    const subarray = arr1[0..2];
    print("type of arr1: {}\n", .{@TypeOf(arr1)});
    print("type of subarray: {}\n", .{@TypeOf(subarray)});
    print("subarray: {any}\n", .{subarray});
    print("subarray len: {}\n", .{subarray.len});
}

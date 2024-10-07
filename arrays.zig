const std = @import("std");
const expect = std.testing.expect;
const assert = std.debug.assert;
const mem = std.mem;








const message = [_]u8{ 'h', 'e', 'l', 'l', 'o' };
const same_massage = "hello";







comptime {
    assert(message.len == 5);
}

comptime {
    assert(mem.eql(u8, &message, same_massage));
}

var some_integer: [100]i32 = undefined;
test "array iteration" {
    for (some_integer) |*item, i| {
        item.* = @intCast(i32, i);
    }
    try expect(some_integer[10] == 10);
    try expect(some_integer[70] == 70);
}

const part_one = [_]i32{ 1, 2, 3, 4, 5 };
const part_two = [_]i32{ 6, 7, 8, 9, 10 };
const all = part_one ++ part_two;
comptime {
    assert(mem.eql(i32, &all, &[_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }));
    //     assert(mem.eql(i32,&all,&[_]{1,2,3,4,5,6,7,8,9,10}));
}

const print = @import("std").debug.print;
const expect = @import("std").testing.expect;

// test "defer" {
//     // this will exexute at end recardless
//     defer print("deffered\n", .{});
//
//     // only run if there was an error
//     errdefer print("ther was an error\n", .{});
//
//     print("hello world1\n", .{});
//     print("hello world2\n", .{});
//     const some_error: anyerror!u8 = error.SomeError;
//     try some_error;
//
//     print("hello world3\n", .{});
// }

test "defer 1" {
    var x: i16 = 5;
    {
        defer x += 2;
        try expect(x == 5);
    }
    try expect(x == 7);
}

test "multi defer" {
    var x: f32 = 5;
    {
        defer x += 2;
        defer x /= 2;
    }
    try expect(x == 4.5);
}

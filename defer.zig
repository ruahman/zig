const print = @import("std").debug.print;

test "defer" {
    // this will exexute at end recardless
    defer print("deffered\n", .{});

    // only run if there was an error
    errdefer print("ther was an error\n", .{});

    print("hello world1\n", .{});
    print("hello world2\n", .{});
    const some_error: anyerror!u8 = error.SomeError;
    try some_error;

    print("hello world3\n", .{});
}

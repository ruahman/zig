const std = @import("std");

test "Lets add one to twenty" {
    try std.testing.expect(addOne(20) == 21);
}

fn addOne(number: i32) i32 {
    return number + 1;
}

test "skip test" {
    return error.SkipZigTest;
}

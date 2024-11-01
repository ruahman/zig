const std = @import("std");
const expect = std.testing.expect;

fn addOne(number: i32) i32 {
    return number + 1;
}

test "Lets add one to twenty" {
    try expect(addOne(20) == 21);
}

// skip a test
test "skip test" {
    return error.SkipZigTest;
}

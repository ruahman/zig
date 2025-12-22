const print = @import("std").debug.print;

test "boolean" {
    const isRead: bool = true;
    const isFinished: bool = false;

    print("isRead: {}\n", .{isRead});
    print("isFinished: {}\n", .{isFinished});

    const num1: u8 = 3;
    const numb2: u8 = 5;

    print("num1 == numb2: {}\n", .{num1 == numb2});
}

pub fn main() void {
    print("run zig test\n", .{});
}

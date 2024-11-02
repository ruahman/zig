const print = @import("std").debug.print;

pub fn main() void {
    const isRead: bool = true;
    const isFinished: bool = false;

    print("isRead: {}\n", .{isRead});
    print("isFinished: {}\n", .{isFinished});
}

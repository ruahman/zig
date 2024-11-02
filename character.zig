const print = @import("std").debug.print;

pub fn main() void {
    const letter: u8 = 'A';
    const emoji: u21 = '😀';

    print("letter: {}\n", .{letter});
    print("emoji: {}\n", .{emoji});
}

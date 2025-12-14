const print = @import("std").debug.print;

pub fn main() void {
    const a: i32 = -43;
    const b: u32 = 42;
    print("signed: {}\n", .{a});
    print("unsigned: {}\n", .{b});
    const num1: u8 = 255;
    const num2: u8 = 2;
    const wrapping: u8 = num1 +% num2;
    print("wrapping: {}\n", .{wrapping});
    const max: u8 = num1 +| num2;
    print("max: {}\n", .{max});
    const result: u16 = @as(u16, num1) + num2;
    print("result: {}", .{result});
}

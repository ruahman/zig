const print = @import("std").debug.print;

pub fn main() void {
    const a: i32 = -43;
    const b: u32 = 42;
    print("signed: {}\n", .{a});
    print("unsigned: {}\n", .{b});
}

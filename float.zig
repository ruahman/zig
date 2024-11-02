const print = @import("std").debug.print;

pub fn main() void {
    const a: f32 = 3.14;
    const b: f64 = 2.7;

    print("a: {}\n", .{a});
    print("b: {}\n", .{b});
}

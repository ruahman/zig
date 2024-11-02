const print = @import("std").debug.print;

pub fn main() void {
    const value = 5;
    print("value: {}\n", .{value});
    {
        // this doesn't work anymore
        // var value = 10;
        // print("value: {}\n", .{value});
    }
    print("value: {}\n", .{value});
}

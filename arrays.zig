const print = @import("std").debug.print;

pub fn main() void {
    const array = [_]i32{ 1, 2, 3, 4, 5 };
    const slice = array[0..3];

    for (array) |val| {
        print("array: {}\n", .{val});
    }

    for (slice) |val| {
        print("slice: {}\n", .{val});
    }
}

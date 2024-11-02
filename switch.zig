const std = @import("std");
const print = std.debug.print;

const day = 3;

pub fn main() void {
    switch (day) {
        1 => print("monday\n", .{}),
        2 => print("tuesday\n", .{}),
        3 => print("wednsay\n", .{}),
        else => print("any other day\n", .{}),
    }
}

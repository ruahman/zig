const std = @import("std");
const print = std.debug.print;
const expect = @import("std").testing.expect;

var count: u32 = 0;

test "while 1" {
    while (count < 15) {
        print("count: {}\n", .{count});
        count += 1;
    }
    while (count < 30) : (count += 1) {
        print("count: {}\n", .{count});
    }
    while (true) {
        if (count > 45) {
            break;
        }
        print("count: {}\n", .{count});
        count += 1;
    }
}

test "while 2" {
    var i: u8 = 2;
    while (i < 100) {
        i *= 2;
    }
    try expect(i == 128);
}

test "while with continue expression" {
    var sum: u8 = 0;
    var i: u8 = 1;
    while (i <= 10) : (i += 1) {
        sum += i;
    }
    try expect(sum == 55);
}

test "while with continue" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i <= 3) : (i += 1) {
        if (i == 2) continue;
        sum += i;
    }
    try expect(sum == 4);
}

test "while with break" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i <= 3) : (i += 1) {
        if (i == 2) break;
        sum += i;
    }
    try expect(sum == 1);
}

pub fn main() void {
    print("zig test while\n", .{});
}

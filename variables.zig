const std = @import("std");
const @"an identifier with spaces in it" = 0xff;
const @"oneSmallStepForMan" = 123;
const c = std.c;
const print = std.debug.print;
const expect = std.testing.expect;

pub extern "c" fn @"error"() void;
pub extern "c" fn @"fstat$INODE64"(fd: c.fd_t, bug: *c.stat) c_int;

const Color = enum { red, @"really red" };

const color: Color = .@"really red";

pub fn main() void {
    print("whatever {s}\n", .{"what"});
}

var y: i32 = add(10, x);
const x: i32 = add(12, 34);

test "container level" {
    try expect(x == 46);
    try expect(y == 56);
}

fn add(a: i32, b: i32) i32 {
    return a + b;
}

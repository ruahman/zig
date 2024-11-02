const print = @import("std").debug.print;

const Person = struct {
    name: []const u8,
    age: u8,
};

pub fn main() void {
    const alice = Person{ .name = "Diego", .age = 43 };
    print("alice: {}\n", .{alice});
}

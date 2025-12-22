const std = @import("std");

// it can be and integer or bool
const SimpleUnion = union { integer: u8, boolean: bool };

test "union" {
    // can only be integer or bool
    // only one field is active at a time
    const simple_union: SimpleUnion = SimpleUnion{ .integer = 5 };
    std.debug.print("simple_union: {}\n", .{simple_union.integer});
    const simple_union2: SimpleUnion = SimpleUnion{ .boolean = true };
    std.debug.print("simple_union2: {}\n", .{simple_union2.boolean});
}

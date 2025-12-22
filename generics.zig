const std = @import("std");

fn Point(comptime T: type) type {
    return struct { x: T, y: T, z: T };
}

fn LinkedList(comptime T: type) type {
    return struct { data: T, next: ?*@This() = null };
}

test "generic" {
    const U8Point = Point(u8);
    const origin: U8Point = .{ .x = 0, .y = 0, .z = 0 };
    std.debug.print("origin: {}\n", .{origin});

    const U8LinkedList = LinkedList(u8);
    var head_node: U8LinkedList = U8LinkedList{ .data = 10 };
    var next_node: U8LinkedList = U8LinkedList{ .data = 22 };
    head_node.next = &next_node;
    std.debug.print("head_node: {}\n", .{head_node});
}

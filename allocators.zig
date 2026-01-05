const std = @import("std");

const print = std.debug.print;
const Allocator = std.mem.Allocator;
const GeneralPurposeAllocator = std.heap.GeneralPurposeAllocator;

const LinkedListNode = struct {
    value: u8,
    next: ?*LinkedListNode = null,

    fn push(this: *LinkedListNode, new_val: u8, allocator: Allocator) !void {
        const next_node: *LinkedListNode = try allocator.create(LinkedListNode);
        errdefer allocator.destroy(next_node);

        next_node.* = LinkedListNode{ .value = new_val };
        this.next = next_node;
    }
};

fn createSlice(allocator: Allocator) !void {
    // alloc if for creating slices
    const output = try allocator.alloc(u8, 3);
    _ = output;
}

test "allocator" {
    // this creates a struct type, {} initialized it
    var gpa = GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const allocator: Allocator = gpa.allocator();

    var head_node: LinkedListNode = LinkedListNode{ .value = 10 };
    try head_node.push(13, allocator);
    defer allocator.destroy(head_node.next.?);
    print("head node value: {}\n", .{head_node.value});
    print("head node next: {}\n", .{head_node.next.?.value});

    // const slice1 = createSlice(allocator);
    // print("slice: {any}\n", .{slice1});
    // defer allocator.free(slice1);

    const slice: []u8 = try allocator.alloc(u8, 3);
    defer allocator.free(slice);
    slice[0] = 0;
    slice[1] = 111;
    slice[2] = 222;
    print("slice: {any}\n", .{slice});

    // _ = try createSlice(allocator);
}

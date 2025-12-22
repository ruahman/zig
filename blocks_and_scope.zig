const std = @import("std");
const print = std.debug.print;

test "blocks" {
    {
        const x = "Im in the block";
        {
            // can not shadow variables
            const x1 = "im another block";
            print("x1: {s}\n", .{x1});
        }
        print("x: {s}\n", .{x});
        // blocks are expresions
        const block_output = outer_block: {
            // to return a value from a block the block must be labeled
            // you must breat the from the block using the labele in order to return something
            break :outer_block @as(u8, 11);
        };
        print("block_out: {}\n", .{block_output});
    }

    // this would break
    // print("x: {s}\n", .{x});
}

pub fn main() void {
    print("zig test blocks");
}

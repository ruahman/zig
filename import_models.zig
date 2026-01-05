const std = @import("std");

// const User = @import("models/user.zig").User;

// pub const User = struct {
//     power: u64,
//     name: []const u8,
// };

const user = @import("models/user.zig");
const User = user.User;
const MAX_POWER = user.MAX_POWER;

fn add(a: i64, b: i64) i64 {
    return a + b;
}

pub fn main() void {
    var user1 = User{
        .power = 9001,
        .name = "Goku",
    };

    const user2: User = .{
        .power = 9002,
        .name = "Gohon",
    };

    user1.diagnose();
    User.diagnose(user1);

    std.debug.print("{}", .{user1});
    std.debug.print("{}", .{user2});

    const sum = add(8999, 2);
    std.debug.print("8999 + 2 = {d}\n", .{sum});

    // arrays
    const aa = [5]i32{ 1, 2, 3, 4, 5 };
    const bb: [5]i32 = .{ 1, 2, 3, 4, 5 };
    const cc = [_]i32{ 1, 2, 3, 4, 5 };
    const slice = aa[1..4];
    for (aa) |e| {
        std.debug.print("{}\n", .{e});
    }
    for (bb) |e| {
        std.debug.print("{}\n", .{e});
    }
    for (cc) |e| {
        std.debug.print("{}\n", .{e});
    }
    for (slice) |e| {
        std.debug.print("{}\n", .{e});
    }

    const a = [_]i32{ 1, 2, 3, 4, 5 };
    var end: usize = 4;
    end += 1;
    const b = a[1..end];
    std.debug.print("{any}", .{@TypeOf(b)});
}

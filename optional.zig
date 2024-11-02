const print = @import("std").debug.print;

fn getValue(x: bool) ?i32 {
    if (x) {
        return 33;
    } else {
        return null;
    }
}

pub fn main() void {
    if (getValue(true)) |v| {
        print("value: {}\n", .{v});
    } else {
        print("nothing\n", .{});
    }

    if (getValue(false)) |v| {
        print("value: {}\n", .{v});
    } else {
        print("nothing\n", .{});
    }

    var x: ?i32 = null;
    print("x: {?}\n", .{x});
    x = 77;
    print("x: {?}\n", .{x});
}

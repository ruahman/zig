// optional type is a type that can have null values

const print = @import("std").debug.print;

fn getValue(x: bool) ?i32 {
    if (x) {
        return 33;
    } else {
        return null;
    }
}

test "optional" {
    var optional_int: ?u8 = null;
    print("optional_int: {?}\n", .{optional_int});
    optional_int = 10;
    print("optional_int: {?}\n", .{optional_int});

    var optional_bool: ?bool = null;
    optional_bool = true;
    const unwrapped_int: u16 = optional_int orelse 0;
    const unwrapped_bool: bool = optional_bool orelse false;
    print("unwrapped_int: {}\n", .{unwrapped_int});
    print("unwrapped_bool: {}\n", .{unwrapped_bool});

    const unwrapped_int2: u8 = optional_int.?;
    const unwrapped_bool2 = optional_bool.?;
    print("unwrapped_int2: {}\n", .{unwrapped_int2});
    print("unwrapped_bool2: {}\n", .{unwrapped_bool2});

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

pub fn main() void {
    print("run zig test");
}

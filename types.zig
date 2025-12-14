const std = @import("std");

const print = std.debug.print;

test "test types" {
    const unsigned_int: u8 = 15;
    const signed_int: i16 = -9;

    _ = unsigned_int;
    _ = signed_int;

    // floats
    const float_16: f16 = 1.234;
    const float_32: f32 = 1.234;
    const float_64: f64 = 1.234;
    _ = float_16;
    _ = float_32;
    _ = float_64;

    // bool
    const a_bool: bool = true;
    // _ = a_bool;

    // void
    // what get return for a void function
    const a_void: void = void{};
    _ = a_void;

    // type
    const u8_type: type = u8;
    print("u8_type: {}\n", .{u8_type});
    const type_of_a_bool: type = @TypeOf(a_bool);
    print("type_of_a_bool: {}\n", .{type_of_a_bool});
    const const_int = 5;
    const const_float = 1.123;
    // value are know at compile time
    print("type of const_int: {}\n", .{@TypeOf(const_int)});
    print("type of const_float: {}\n", .{@TypeOf(const_float)});
}

pub fn main() void {
    print("to see tests `zig test types.zig`");
}

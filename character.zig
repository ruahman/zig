const print = @import("std").debug.print;

test "characters" {
    const letter: u8 = 'A';
    const emoji: u21 = '😀';
    const b_char = 'b';
    const a_string = "This is a string";
    const concat_string = a_string ++ " cat";

    print("letter: {}\n", .{letter});
    print("emoji: {}\n", .{emoji});
    print("type of b_char: {}\n", .{@TypeOf(b_char)});
    print("a_string: {s}\n", .{a_string});
    print("concat_string: {s}\n", .{concat_string});
    print("a_string type: {}\n", .{@TypeOf(a_string)});
}

pub fn main() void {
    print("run zig test characters\n", .{});
}

const std = @import("std");

fn doSomething(comptime comptime_par: u8, input2: u8) void {
    std.debug.print("comptime_par: {}\n", .{comptime_par});
    std.debug.print("input2: {}\n", .{input2});
}

test "comptime" {
    // value is known at compile time
    const comptime_known = 10;
    // this value is know at compile time
    std.debug.print("comptime: {}\n", .{@TypeOf(comptime_known)});

    // because this is know at comptime this never gets hit
    if (comptime_known != 10) {
        @compileError("throw this error at compile time");
    }

    var runtime_know: u8 = 1;
    runtime_know = 5;

    // because this isn't known at comptime this gets hit
    if (runtime_know != 5) {
        // @compileError("this gets hit");
    }

    // stored as a variable in comptime
    comptime var comptime_mutable_var: u8 = 0;
    comptime_mutable_var = 11;
    // const comptime_const: u8 = comptime 0;

    // must pass in a compile time parameter
    doSomething(comptime_mutable_var, 77);

    // all parameter must be comptime now
    // comptime doSomething(comptime_mutable_var, comptime_const);
}

pub fn main() void {
    std.debug.print("run zig test", .{});
}

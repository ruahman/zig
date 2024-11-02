// const std = @import("std");
// const print = std.debug.print;
//
// fn doSomething(x: bool) !void {
//     if (x == true) {
//         return error.SomeError;
//     } else {
//         print("no error\n", .{});
//     }
// }
//
// pub fn main() void {
//     // doSomething(false);
//     if (doSomething(true)) |err| {
//         print("error: {}\n", .{err});
//     }
// }

const std = @import("std");
const print = std.debug.print;

const MyError = error{
    FileNotFound,
    PermissionDenied,
    Unknown,
};

pub fn openFile(filename: []const u8) !void {
    if (filename.len == 0) {
        return MyError.FileNotFound;
    }

    // Simulate other conditions
    return MyError.Unknown;
}

pub fn main() !void {

    // handle the error yourself the exit
    const result2 = openFile("") catch |err| {
        print("my error: {}\n", .{err});
        return;
    };

    print("result2: {}\n", .{result2});

    // if error propagate it
    const result = try openFile("example.txt");
    print("result: {}\n", .{result});
}

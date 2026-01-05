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

// errors are not thrown but returned

// an error set is like an enum
const IOError = error{ FileNotFount, PermissionDenied, ValueIsNull };
const PrintError = error{ValueIsNull};
const SingleError = error.IAmSingle;

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

test "errors " {
    print("IOError.FileNotFount: {}\n", .{IOError.FileNotFount});

    // this is an error union
    // it can hold a value or an error
    var int_or_error: IOError!u8 = 33;

    // if statment for error union
    if (int_or_error) |val| {
        print("I got a value {}\n", .{val});
    } else |err| {
        print("I got an error {}\n", .{err});
    }

    int_or_error = IOError.FileNotFount;

    if (int_or_error) |val| {
        print("I got a value {}\n", .{val});
    } else |err| {
        print("I got an error {}\n", .{err});
    }

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

pub fn main() !void {
    print("run zig test ./errors.zig\n", .{});
}

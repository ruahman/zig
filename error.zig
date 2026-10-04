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

const expect = @import("std").testing.expect;

const FileOpenError = error{
    AccessDenied,
    OutOfMemory,
    FileNotFound,
};

const AllocationError = error{OutOfMemory};

test "coerce error from a subset to a superset" {
    const err: FileOpenError = AllocationError.OutOfMemory;
    try expect(err == FileOpenError.OutOfMemory);
}

test "error union" {
    const maybe_error: AllocationError!u16 = 10;
    const no_error = maybe_error catch 0;

    try expect(@TypeOf(no_error) == u16);
    try expect(no_error == 10);
}

fn failingFunction() error{Oops}!void {
    return error.Oops;
}

test "returning an error" {
    failingFunction() catch |err| {
        try expect(err == error.Oops);
        return;
    };
}

fn failFn() error{Oops}!i32 {
    try failingFunction();
    return 12;
}

test "try" {
    const v = failFn() catch |err| {
        try expect(err == error.Oops);
        return;
    };
    try expect(v == 12); // is never reached
}

var problems: u32 = 98;

fn failFnCounter() error{Oops}!void {
    errdefer problems += 1;
    try failingFunction();
}

test "errdefer" {
    failFnCounter() catch |err| {
        try expect(err == error.Oops);
        try expect(problems == 99);
        return;
    };
}

fn createFile() !void {
    return error.AccessDenied;
}

test "inferred error set" {
    //type coercion successfully takes place
    const x: error{AccessDenied}!void = createFile();

    //Zig does not let us ignore error unions via _ = x;
    //we must unwrap it with "try", "catch", or "if" by any means
    _ = x catch {};
}

// errors can be merged
const A = error{ NotDir, PathNotFound };
const B = error{ OutOfMemory, PathNotFound };
const C = A || B;

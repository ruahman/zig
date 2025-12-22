const print = @import("std").debug.print;

const Person = struct {
    name: []const u8,
    age: u8,
};

const Point = struct {
    x: u8,
    y: u8,
    z: u8,

    // varable for struct kinda like static
    const num_of_dimensions = 3;
    var num: u8 = 0;

    fn init(x: u8, y: u8, z: u8) Point {
        num += 1;
        return Point{ .x = x, .y = y, .z = z };
    }

    // if first parameter is same as type that called it then its an instance method
    fn printPoint(this: Point) void {
        print("print: {}\n", .{this});
    }

    // if you want to modify it you need to make this a pointer
    fn increment(this: *Point) void {
        this.x += 1;
        this.y += 1;
        this.z += 1;
    }
};

test "struct" {
    const alice = Person{ .name = "Diego", .age = 43 };
    print("alice: {}\n", .{alice});

    const origin: Point = Point{ .x = 0, .y = 0, .z = 0 };
    print("origin: {}\n", .{origin});

    const origin1: Point = .{ .x = 0, .y = 0, .z = 0 };
    print("origin1: {}\n", .{origin1});

    print("num_of_dimensions: {}\n", .{Point.num_of_dimensions});

    var point3: Point = Point.init(3, 3, 3);
    print("point3: {}\n", .{point3});
    print("point3.num: {}\n", .{Point.num});
    point3.printPoint();
    // or you can call it this way
    Point.printPoint(point3);

    point3.increment();
    point3.printPoint();

    // tuple is a struct with no name
    const tuple = .{ 2, 5.5, true, "hello" };
    print("tuple: {}\n", .{tuple});
    print("tuple[0]: {}\n", .{tuple[0]});
    print("tuple[0]: {}\n", .{tuple.@"0"});
    print("tuple len: {}\n", .{tuple.len});
}

pub fn main() void {
    print("zig test struct");
}

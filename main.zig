const std = @import("std");
const Base64 = @import("Base64.zig").Base64;
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    var memory_buffer: [21]u8 = undefined; // Absolute minimum amount for my case
    var fba = std.heap.FixedBufferAllocator.init(&memory_buffer);
    const allocator = fba.allocator();

    const text = "Some text";
    const etext = "U29tZSB0ZXh0";
    const base64 = Base64.init();
    const encoded_text = try base64.encode(allocator, text);
    const decoded_text = try base64.decode(allocator, etext);

    try stdout.print("Encoded text: {s}\n", .{encoded_text});
    try stdout.print("Decoded text: {s}\n", .{decoded_text});
}

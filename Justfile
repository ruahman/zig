#!/usr/bin/env just --justfile

build file:
    zig build-exe {{file}}

test file:
    zig test {{file}}

run file:
    zig run {{file}}

clean:
    rm -rf .zig-cache
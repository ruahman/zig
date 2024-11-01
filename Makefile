build:
	zig build-exe $(f)

run:
	zig run $(f)

test:
	zig test $(t)

.PHONEY: build run test


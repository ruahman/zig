set positional-arguments

flake:
  nix develop

build arg:
	zig build-exe $1

run arg:
	zig run $1

test arg:
	zig test $1


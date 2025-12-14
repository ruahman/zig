
flake:
  nix develop

build arg:
	zig build-exe {{arg}}

run arg:
	zig run {{arg}}

test arg:
	zig test {{arg}}


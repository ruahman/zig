
build:
	zig build-exe $(f)

run:
	zig run $(f)

test:
	zig test $(t)

clean:
	- rm main main.o main.exe main.pdb main.exe.obj



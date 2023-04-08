DIR := ${CURDIR}

CONTAINER := zig

IMAGE := zig:ruahman

EXE := test

build:
	zig build-exe main.zig

run:
ifdef zig
	zig run ./main.zig
else
	./main
endif

test:
	zig test *_test.zig

clean:
	- rm main main.o main.exe main.pdb main.exe.obj


docker:
ifdef run
	docker run -it -v $(DIR):/code --name $(CONTAINER) $(IMAGE) bash
else ifdef start
	docker start -ai $(CONTAINER)
else ifdef build
	docker build -t $(IMAGE) .
else ifdef rm
	docker container rm $(CONTAINER)
else ifdef rmi
	docker image rm $(IMAGE)
else
	@echo please specify either run, start, build, rm, or rmi
endif

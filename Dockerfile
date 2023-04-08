FROM buildpack-deps:buster

RUN curl https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.2401+348751462.tar.xz -O && \
    tar xvf zig-linux-x86_64-0.11.0-dev.2401+348751462.tar.xz

ENV PATH="${PATH}:/zig-linux-x86_64-0.11.0-dev.2401+348751462"

WORKDIR /code

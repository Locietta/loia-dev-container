FROM debian:unstable
LABEL maintainer="locietta@qq.com"

RUN apt-get update && apt-get install curl wget ca-certificates git gpg -y && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    echo "deb http://apt.llvm.org/unstable/ llvm-toolchain main" > /etc/apt/sources.list.d/llvm.list && \
    apt-get update && apt-get install llvm clang lldb lld -y; \
    apt-get autoclean; rm -rf /var/lib/apt/lists/*
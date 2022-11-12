FROM debian:unstable
LABEL maintainer="locietta@qq.com"

RUN apt update && apt install wget ca-certificates git && \
    wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    echo "deb http://apt.llvm.org/unstable/ llvm-toolchain main" > /etc/apt/sources.list.d/llvm.list && \
    apt update && apt install llvm clang lldb lld; \
    apt-get autoclean; rm -rf /var/lib/apt/lists/*
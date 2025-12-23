
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    vim \
    bison \
    flex \
    libfl-dev \
    help2man \
    z3 \
    git \
    autoconf \
    make \
    g++ \
    perl \
    python3 \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# FIXME: clang may be a lot faster than g++
# should implement a clean target in the prj makefile too

RUN git clone https://github.com/verilator/verilator && \
    cd verilator && \
    autoconf && \
    ./configure && \
    make -j$(nproc) && \
    make install

WORKDIR /opt
RUN wget https://www.accellera.org/images/downloads/standards/uvm/Accellera-1800.2-2017-1.0.tar.gz && \
    tar -xzf Accellera-1800.2-2017-1.0.tar.gz

ENV UVM_HOME=/opt/1800.2-2017-1.0/src
WORKDIR /workspace

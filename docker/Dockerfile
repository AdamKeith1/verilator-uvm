# # - Dependencies --------- #
# #   - verilator
# #   - python3 and pip
# #   - antmicro uvm plugin
# #   
# # ------------------------ #

# FROM ubuntu:22.04

# ENV DEBIAN_FRONTEND=noninteractive

# RUN apt-get update && apt-get install -y \
#     bison \
#     flex \
#     libfl-dev \
#     help2man \
#     z3 \
#     git \
#     autoconf \
#     make \
#     g++ \
#     perl \
#     python3

# RUN git clone https://github.com/verilator/verilator && \
#     pushd verilator && \
#     autoconf && \
#     ./configure && \
#     make -j `nproc` && \
#     popd

# RUN wget https://www.accellera.org/images/downloads/standards/uvm/Accellera-1800.2-2017-1.0.tar.gz
# RUN tar -xvzf Accellera-1800.2-2017-1.0.tar.gz

# # COPY ../rtl/alu workspace/rtl/
# # COPY ../uvm/block/alu/testbench workspace/testbench

# ENV UVM_HOME="$(pwd)/1800.2-2017-1.0/src"
# ENV PATH="$(pwd)/verilator/bin:$PATH"

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
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

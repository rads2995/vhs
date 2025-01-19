FROM redhat/ubi9-minimal:latest

# Update, upgrade, and install dependencies
RUN microdnf -y upgrade
RUN microdnf -y install \
    gcc \
    gcc-c++ \
    m4 \
    python3.12 \
    python3.12-pip \
    python3.12-devel \
    zlib-devel \
    git

RUN ln -s /usr/bin/python3.12 /usr/bin/python3
RUN ln -s /usr/bin/python3.12-config /usr/bin/python3-config

RUN python3 -m pip install scons

WORKDIR /usr/local/src

RUN git clone https://github.com/gem5/gem5

WORKDIR /usr/local/src/gem5

RUN scons build/RISCV/gem5.opt -j `nproc`

RUN ./build/RISCV/gem5.opt simple-riscv.py

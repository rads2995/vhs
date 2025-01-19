# Build from Red Hat Universal Base Image
FROM redhat/ubi9-minimal:latest

# Update packages and install required dependencies to build gem5
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

# Install required Python packages to build gem5
RUN python3.12 -m pip install scons

# Create symbolic links for gem5's internal calls to Python 3
RUN ln -s /usr/bin/python3.12 /usr/bin/python3
RUN ln -s /usr/bin/python3.12-config /usr/bin/python3-config

WORKDIR /usr/local/src

# Clone gem5 forked repository with changes for the PIC64-HPSC processor
RUN git clone https://github.com/rads2995/gem5.git -b develop

WORKDIR /usr/local/src/gem5

# Build gem5 for the RISC-V ISA with optimizations and debug symbols
RUN scons build/RISCV/gem5.opt -j `nproc`

WORKDIR /usr/local/src/

FROM debian:bullseye
ENV REPO_OPENGL="https://github.com/thesodadev/OpenGL-Registry.git" \
    REPO_EGL="https://github.com/thesodadev/EGL-Registry.git" \
    REPO_GLFIXES="https://github.com/thesodadev/glfixes"
RUN apt update && \
    apt install build-essential binutils-arm-none-eabi gcc-arm-none-eabi libnewlib-dev- -y && \ 
    apt install blender git python libtool autoconf automake -y && \
    apt install libglu1-mesa-dev libxmu-dev libxi-dev libgl-dev libfreeimage-dev -y && \
    mkdir /nds && mkdir /nds/sdk && \
    cd /nds/sdk && git clone https://github.com/thesodadev/glew.git && cd glew/auto && make && cd .. && make && make install && \
    cd /nds/sdk && git clone https://github.com/thesodadev/SDL.git && cd SDL && ./configure && make && make install && \
    cd /nds/sdk && git clone https://github.com/thesodadev/steroids.git && cd steroids && make install && \
    cd /nds/sdk && git clone https://github.com/thesodadev/nmdl.git && cd nmdl && make all && make install && \
    cd /nds/sdk && git clone https://github.com/thesodadev/grit.git && cd grit && ./autogen.sh && ./configure && make && make install && \
    cd /nds/sdk && git clone -b standalone_build https://github.com/thesodadev/ndstool.git && cd ndstool && make all && make install && \
    cd /nds/sdk && git clone https://github.com/thesodadev/ndsutils.git && cd ndsutils && ./autogen.sh && ./configure && make && make install && \
    cd /nds/sdk && git clone -b devkitARM  https://github.com/thesodadev/newlib.git && cd newlib && \
    CFLAGS_FOR_TARGET="-O2 -ffunction-sections -fdata-sections" && \
    ./configure --prefix=/usr/lib --disable-newlib-supplied-syscalls --enable-newlib-mb --disable-newlib-wide-orient --target=arm-none-eabi && \
    make && make install && \
    cd /nds/sdk && git clone -b standalone_build https://github.com/thesodadev/libnds.git && cd libnds && make all && make install && \
    cd /nds/sdk && git clone -b standalone_build https://github.com/thesodadev/libfat.git && cd libfat && make all && make install && \
    cd /nds/sdk && git clone -b standalone_build https://github.com/thesodadev/ndscrt.git && cd ndscrt && make all && make install && \
    cd /nds/sdk && git clone https://github.com/thesodadev/blender_scripts.git && cd blender_scripts && make install && \
    cd /nds && rm -rf sdk

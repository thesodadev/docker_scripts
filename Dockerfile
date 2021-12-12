FROM debian:bullseye
ENV REPO_OPENGL="https://github.com/thesodadev/OpenGL-Registry.git" \
    REPO_EGL="https://github.com/thesodadev/EGL-Registry.git" \
    REPO_GLFIXES="https://github.com/thesodadev/glfixes"
RUN apt update && \
    apt install git python build-essential binutils-arm-none-eabi gcc-arm-none-eabi libtool autoconf automake -y && \
    apt install libglu1-mesa-dev libxmu-dev libxi-dev libgl-dev -y && \
    mkdir /nds && mkdir /nds/sdk && \
    cd /nds/sdk && git clone https://github.com/thesodadev/glew.git && cd glew/auto && make && cd .. && make && make install && \
    cd /nds/sdk && git clone https://github.com/thesodadev/SDL.git && cd SDL && ./configure && make && make install && \
    cd /nds/sdk && git clone https://github.com/thesodadev/steroids.git && cd steroids && make install && \
    cd /nds/sdk && git clone https://github.com/thesodadev/nmdl.git && cd nmdl && make all && make install

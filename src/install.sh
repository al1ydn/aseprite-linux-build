#!/usr/bin/env bash

apt-get update

mkdir /app/skia
apt-get install -y wget
wget https://github.com/aseprite/skia/releases/download/m102-861e4743af/Skia-Linux-Release-x64-libc++.zip -P /app/skia

mkdir -p $HOME/deps/skia
apt-get install -y unzip
unzip /app/skia/Skia-Linux-Release-x64-libc++.zip -d $HOME/deps/skia

mkdir /app/aseprite
wget https://github.com/aseprite/aseprite/releases/download/v1.3.2/Aseprite-v1.3.2-Source.zip -P /app/aseprite

mkdir $HOME/aseprite
unzip /app/aseprite/Aseprite-v1.3.2-Source.zip -d $HOME/aseprite

apt-get install -y g++ clang libc++-dev libc++abi-dev cmake ninja-build libx11-dev libxcursor-dev libxi-dev libgl1-mesa-dev libfontconfig1-dev

mkdir $HOME/aseprite/build
cd $HOME/aseprite/build
export CC=clang
export CXX=clang++
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CXX_FLAGS:STRING=-stdlib=libc++ -DCMAKE_EXE_LINKER_FLAGS:STRING=-stdlib=libc++ -DLAF_BACKEND=skia -DSKIA_DIR=$HOME/deps/skia -DSKIA_LIBRARY_DIR=$HOME/deps/skia/out/Release-x64 -DSKIA_LIBRARY=$HOME/deps/skia/out/Release-x64/libskia.a -G Ninja ..

ninja aseprite

cp $HOME/aseprite/build/bin /app/bin -r
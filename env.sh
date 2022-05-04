#!/usr/bin/env bash
yum install -y centos-release-scl epel-release
yum install -y devtoolset-9 cmake3 ninja-build git rh-python38
ln -s /usr/bin/cmake3 /usr/bin/cmake
scl enable devtoolset-9 rh-python38 ./build.sh

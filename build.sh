#!/usr/bin/env bash
yum install -y centos-release-scl epel-release
yum install -y devtoolset-9 cmake3 ninja-build git rh-python38
ln -s /usr/bin/cmake3 /usr/bin/cmake
scl enable devtoolset-9 rh-python38 bash <<EOT
python3 llvm/buildbot/configure.py --hip --hip-platform AMD -t release \
  --cmake-opt="-DSYCL_BUILD_PI_HIP_INCLUDE_DIR=$HOME/dtk-21.10/hip/include" \
  --cmake-opt="-DSYCL_BUILD_PI_HIP_HSA_INCLUDE_DIR=$HOME/dtk-21.10/hsa/include" \
  --cmake-opt="-DSYCL_BUILD_PI_HIP_AMD_LIBRARY=$HOME/dtk-21.10/hip/lib/libamdhip64.so"
python3 llvm/buildbot/compile.py -j $(nproc)
EOT

#!/usr/bin/env bash
python3 llvm/buildbot/configure.py --hip --hip-platform AMD -t release \
  --cmake-opt="-DSYCL_BUILD_PI_HIP_INCLUDE_DIR=/public/software/compiler/rocm/dtk-21.10/hip/include" \
  --cmake-opt="-DSYCL_BUILD_PI_HIP_HSA_INCLUDE_DIR=/public/software/compiler/rocm/dtk-21.10/hsa/include" \
  --cmake-opt="-DSYCL_BUILD_PI_HIP_AMD_LIBRARY=/public/software/compiler/rocm/dtk-21.10/hip/lib/libamdhip64.so"
python3 llvm/buildbot/compile.py -j $(nproc)

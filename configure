python3 llvm/buildbot/configure.py --hip --hip-platform AMD -t release \
  --cmake-opt="-DSYCL_BUILD_PI_HIP_INCLUDE_DIR=$HOME/dtk-21.10/hip/include" \
  --cmake-opt="-DSYCL_BUILD_PI_HIP_HSA_INCLUDE_DIR=$HOME/dtk-21.10/hsa/include" \
  --cmake-opt="-DSYCL_BUILD_PI_HIP_AMD_LIBRARY=$HOME/dtk-21.10/hip/lib/libamdhip64.so"
python3 llvm/buildbot/compile.py -j $(nproc)

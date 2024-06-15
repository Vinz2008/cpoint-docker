set (CMAKE_SYSTEM_NAME Linux)
set (CMAKE_SYSTEM_PROCESSOR x86_64)

# specify the cross compiler
set (CMAKE_C_COMPILER aarch64-linux-gnu-gcc)
set (CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)

# where is the target environment
set (CMAKE_FIND_ROOT_PATH /usr/aarch64-linux-gnu)

# search for programs in the build host directories
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# Make sure Qt can be detected by CMake
set (QT_BINARY_DIR /usr/aarch64-linux-gnu/bin /usr/bin)
set (QT_INCLUDE_DIRS_NO_SYSTEM ON)
set (QT_HOST_PATH "/usr" CACHE PATH "host path for Qt")

# set the resource compiler (RHBZ #652435)
# set (CMAKE_RC_COMPILER @TRIPLE@-windres)
# set (CMAKE_MC_COMPILER @TRIPLE@-windmc)

# override boost thread component suffix as mingw-w64-boost is compiled with threadapi=win32
# set (Boost_THREADAPI win32)

# These are needed for compiling lapack (RHBZ #753906)
set (CMAKE_Fortran_COMPILER aarch64-linux-gnu-gfortran)
set (CMAKE_AR:FILEPATH aarch64-linux-gnu-ar)
set (CMAKE_RANLIB:FILEPATH aarch64-linux-gnu-ranlib)


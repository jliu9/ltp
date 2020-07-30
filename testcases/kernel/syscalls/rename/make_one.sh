#! /bin/bash

TARGET_NAME="rename01"

if [ $# -gt 0 ]
then
    TARGET_NAME=$1
fi

echo ">======= build ${TARGET_NAME}"
SRC_NAME="${TARGET_NAME}.c"

CFS_ROOT="${HOME}/workspace/ApparateFS/cfs/"

CFS_INC="${CFS_ROOT}/include/"
CFS_LIB="${CFS_ROOT}/build/"

VER_=$(uname -r)
VER_NUM=${VER_:0:5}
echo $VER_NUM

TBB_LIB="${CFS_ROOT}/lib/tbb/build/linux_intel64_gcc_cc7_libc2.27_kernel${VER_NUM}_release"

ADD_LD_LIBS="-lcfs -lrt -lglog -lfolly -lstdc++ -lgflags -ltbb -liberty"

gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition \
    -I../../../../include -I../../../../include -I../../../../include/old/ \
    -I${CFS_INC}  \
    -L../../../../lib  -L${CFS_LIB} -L${TBB_LIB}\
    ${SRC_NAME}  \
    -lltp ${ADD_LD_LIBS} \
    -rdynamic \
    -o ${TARGET_NAME}

echo ">======= compilation done"
echo ">======= remember to configure this as LD_LIBRARY_PATH"
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:${CFS_LIB}:${TBB_LIB}\""



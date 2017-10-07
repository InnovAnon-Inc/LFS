#! /bin/sh
set -eo nounset

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

./build.sh binutils   tools pass1
./build.sh gcc        tools pass1
./build.sh linux      tools
./build.sh glibc      tools
# LibStdC++
./build.sh gcc        tools pass2
./build.sh binutils   tools pass2
./build.sh gcc        tools pass3
./build.sh tcl-core   tools
./build.sh expect     tools
./build.sh dejagnu    tools
./build.sh ncurses    tools
./build.sh bash       tools
./build.sh bison      tools
./build.sh bzip2      tools
./build.sh coreutils  tools
./build.sh diffutils  tools
./build.sh file       tools
./build.sh findutils  tools
./build.sh gawk       tools
./build.sh gettext    tools
./build.sh grep       tools
./build.sh gzip       tools
./build.sh m4         tools
./build.sh make       tools
./build.sh patch      tools
./build.sh perl       tools
./build.sh sed        tools
./build.sh tar        tools
./build.sh texinfo    tools
./build.sh util-linux tools
./build.sh xz         tools

# TODO v2 with logout and unmount after each pkg

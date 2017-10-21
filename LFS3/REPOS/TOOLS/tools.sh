set -eo nounset

# TODO run as lfs user

/workspace/LFS/LFS3/BLFS/autoconf264.sh
./tools-build-wrapper.sh ./binutils-pass1.sh
/workspace/LFS/LFS3/BLFS/autoconf269.sh
./tools-build-wrapper.sh ./mpfr.sh
./tools-build-wrapper.sh ./gmp.sh
./tools-build-wrapper.sh ./mpc.sh
./tools-build-wrapper.sh ./gcc-pass1.sh
./tools-build-wrapper.sh ./linux-headers.sh
./tools-build-wrapper.sh ./glibc.sh
./tools-build-wrapper.sh ./gcc-libstdc++.sh
/workspace/LFS/LFS3/BLFS/autoconf264.sh
./tools-build-wrapper.sh ./binutils-pass2.sh
/workspace/LFS/LFS3/BLFS/autoconf269.sh
./tools-build-wrapper.sh ./gcc-pass2.sh
./tools-build-wrapper.sh ./tcl.sh
echo TODO
exit 2
./expect.sh
./dejagnu.sh
./check.sh
./ncurses.sh
./bash.sh
./bison.sh
./bzip2.sh
./coreutils.sh
./diffutils.sh
./file.sh
./findutils.sh
./gawk.sh
./gettext.sh
./grep.sh
./gzip.sh
./m4.sh
./make.sh
./patch.sh
./perl.sh
./sed.sh
./tar.sh
./texinfo.sh
./util-linux.sh
./xz.sh
./stripping.sh

# TODO changing ownership

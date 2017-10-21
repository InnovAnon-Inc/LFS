set -eo nounset

# TODO run as lfs user

#./binutils-pass1.sh
#./gcc-pass1.sh
#./linux-headers.sh
#./glibc.sh
# borked ./gcc-libstdc++.sh
./binutils-pass2.sh
./gcc-pass2.sh
./tcl.sh
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

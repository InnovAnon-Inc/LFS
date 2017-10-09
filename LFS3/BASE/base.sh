set -eo nounset

# TODO preparing virtual kernel file systems
# TODO entering the chroot environment

./creating-directories.sh
./creating-files.sh
./linux-headers.sh
./man-pages.sh
./glibc.sh
./adjusting-the-toolchain.sh
./zlib.sh

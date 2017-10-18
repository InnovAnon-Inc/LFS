set -eo nounset

cd /sources

test -f btrfs-progs-v4.13.2.tar.xz || \
wget --no-check-certificate \
	https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-v4.13.2.tar.xz

rm -rf btrfs-progs-v4.13.2
tar xf btrfs-progs-v4.13.2.tar.xz
pushd  btrfs-progs-v4.13.2

sed -i '1,100 s/\.gz//g' Documentation/Makefile.in &&

./configure --prefix=/usr \
            --bindir=/bin \
            --libdir=/lib &&
make

make fssum &&

sed -i '/found/s/^/: #/' tests/convert-tests.sh &&

mv tests/misc-tests/025-zstd-compression/test.sh{,.broken}      &&
mv tests/convert-tests/010-reiserfs-basic/test.sh{,.broken}     &&
mv tests/convert-tests/011-reiserfs-delete-all-rollback/test.sh{,.broken} &&
mv tests/fuzz-tests/003-multi-check-unmounted/test.sh{,.broken} &&
mv tests/fuzz-tests/009-simple-zero-log/test.sh{,.broken}

pushd tests
   ./fsck-tests.sh
   ./mkfs-tests.sh
   ./cli-tests.sh
   ./convert-tests.sh
   ./misc-tests.sh
   ./fuzz-tests.sh
popd

make install &&

ln -sfv ../../lib/$(readlink /lib/libbtrfs.so) /usr/lib/libbtrfs.so &&
rm -v /lib/libbtrfs.{a,so} &&
mv -v /bin/{mkfs,fsck}.btrfs /sbin

popd
rm -rf btrfs-progs-v4.13.2

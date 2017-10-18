set -eo nounset

cd /sources

test -f mdadm-4.0.tar.xz || \
wget --no-check-certificate \
	https://www.kernel.org/pub/linux/utils/raid/mdadm/mdadm-4.0.tar.xz

rm -rf mdadm-4.0
tar xf mdadm-4.0.tar.xz
pushd  mdadm-4.0

sed 's@-Werror@@' -i Makefile

make

sed -i 's# if.* == "1"#& -a -e $targetdir/log#' test &&
make test

./test --keep-going --logdir=test-logs --save-logs

make install

popd
rm -rf mdadm-4.0

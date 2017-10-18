set -eo nounset

cd /sources

for k in \
https://downloads.sourceforge.net/gptfdisk/gptfdisk-1.0.3.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/gptfdisk-1.0.3-convenience-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf gptfdisk-1.0.3
tar xf gptfdisk-1.0.3.tar.gz
pushd  gptfdisk-1.0.3

patch -Np1 -i ../gptfdisk-1.0.3-convenience-1.patch &&
make POPT=1

make POPT=1 install

popd
rm -rf gptfdisk-1.0.3

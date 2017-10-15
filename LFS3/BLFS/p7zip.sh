set -eo nounset

cd /sources

test -f p7zip_16.02_src_all.tar.bz2 || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/p7zip/p7zip_16.02_src_all.tar.bz2

rm -rf p7zip_16.02
tar xf p7zip_16.02_src_all.tar.bz2
pushd  p7zip_16.02

make all3

make DEST_HOME=/usr \
     DEST_MAN=/usr/share/man \
     DEST_SHARE_DOC=/usr/share/doc/p7zip-16.02 install

popd
rm -rf p7zip_16.02

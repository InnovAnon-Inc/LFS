set -eo nounset

cd /sources

for k in \
wget www.cs.uccs.edu/~qyi/poet/releases/poet.tar.gz \
wget www.cs.uccs.edu/~qyi/poet/releases/poet.vim ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf poet-1.06.01
tar xf poet.tar.gz
pushd  poet-1.06.01

autoreconf-2.65 -fi &&
./configure &&
make &&
make install

install -vDm644 ../poet.vim \
                /usr/share/vim/vim80/syntax/poet.vim

popd
rm -rf poet-1.06.01

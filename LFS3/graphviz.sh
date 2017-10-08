cd /sources

for k in \
http://graphviz.org/pub/graphviz/stable/SOURCES/graphviz-2.40.1.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/graphviz-2.40.1-qt5-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf graphviz-2.40.1
tar xf graphviz-2.40.1.tar.gz
cd graphviz-2.40.1

#sed -e '/ruby/s/1\.9/2.4/' -i configure.ac

#patch -p1 -i ../graphviz-2.40.1-qt5-1.patch

sed -i '/LIBPOSTFIX="64"/s/64//' configure.ac

autoreconf
./configure --prefix=/usr
make

make install

ln -v -s /usr/share/graphviz/doc \
         /usr/share/doc/graphviz-2.40.1

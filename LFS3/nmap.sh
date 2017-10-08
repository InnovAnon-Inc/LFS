cd /sources

test -f nmap-7.60.tar.bz2 || \
wget --no-check-certificate \
	http://nmap.org/dist/nmap-7.60.tar.bz2

rm -rf nmap-7.60
tar xf nmap-7.60.tar.bz2
cd nmap-7.60

./configure --prefix=/usr --with-liblua=included
make

sed -i 's/lib./lib/' zenmap/test/run_tests.py

make install

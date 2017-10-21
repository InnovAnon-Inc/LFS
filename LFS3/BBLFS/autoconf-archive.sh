set -eo nounset

cd /other-repos || cd /repos

if [ -d autoconf-archive ] ; then
	pushd autoconf-archive
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.savannah.gnu.org/git/autoconf-archive.git
fi

cd autoconf-archive

./bootstrap.sh
./configure --prefix=/usr
make
make install

grep -q '^ACLOCAL_FLAGS="-I /usr/local/share/aclocal"' /etc/profile || \
cat >> /etc/profile << "EOF"
ACLOCAL_FLAGS="-I /usr/local/share/aclocal"
EOF


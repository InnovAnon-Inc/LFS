set -eo nounset

cd /other-repos || cd /repos

if [ -d pcre ] ; then
	pushd pcre
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/pcre/pcre.git
fi

cd pcre

./autogen.sh
./configure --prefix=/usr                       \
            --docdir=/usr/share/doc/pcre2-10.30 \
            --enable-unicode                    \
            --enable-pcre2-16                   \
            --enable-pcre2-32                   \
            --enable-pcre2grep-libz             \
            --enable-pcre2grep-libbz2           \
            --enable-pcre2test-libreadline      \
            --disable-static
make
make install


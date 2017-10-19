set -eo nounset

cd /other-repos || cd /repos

if [ -d wget ] ; then
	pushd wget
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://git.savannah.gnu.org/git/wget.git
fi

cd wget

sed -i s/have_gpg=no/have_gpg=yes/g configure.ac
autoreconf -fi
./configure \
            --prefix=/usr \
            --sysconfdir=/etc \
            --with-ssl=openssl
make
make install


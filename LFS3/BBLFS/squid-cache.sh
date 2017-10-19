set -eo nounset

cd /other-repos || cd /repos

if [ -d squid ] ; then
	pushd squid
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/squid-cache/squid.git
fi

cd squid

./bootstrap.sh
./configure --prefix=/usr \
            --sysconfdir=/etc
make
make install


vi /etc/squid.conf

/usr/sbin/squid -z
/usr/sbin/squid

# TODO install bootscripts

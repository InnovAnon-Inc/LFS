set -eo nounset

cd /other-repos || cd /repos

if [ -d freeradius ] ; then
	rm -rf freeradius
fi
#	pushd freeradius
#	git reset --hard
#	git clean -d -f -x
#	git checkout .
#	git pull origin master
#	git submodule update --init --recursive
#	#git pull origin release_3_0_15
#	popd
#else
	git clone https://github.com/FreeRADIUS/freeradius-server.git freeradius
	pushd freeradius
	#git checkout release_3_0_15
	git submodule update --init --recursive
	popd
#fi

cd freeradius

#./autogen.sh
./configure
make
make install


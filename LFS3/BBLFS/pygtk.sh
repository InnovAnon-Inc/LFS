set -eo nounset

cd /other-repos || cd /repos

if [ -d pygtk ] ; then
	pushd pygtk
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone git://git.gnome.org/pygtk.git
fi

cd pygtk

#for P in python2 python3 ; do
#$P setup.py build
#$P setup.py install --optimize=1 --prefix=/usr
##$P setup.py install --prefix=/usr
#done

./autogen.sh
./configure --prefix=/usr
make

make install


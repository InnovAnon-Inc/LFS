set -eo nounset

cd /other-repos || cd /repos

if [ -d tcl ] ; then
        pushd tcl
        git reset --hard
        git clean -d -f -x
        git pull origin master
        popd
else
        git clone https://github.com/tcltk/tcl.git
fi

cd tcl

cd unix
./configure --prefix=/tools

make

#TZ=UTC make test

make install

chmod -v u+w /tools/lib/libtcl8.6.so

make install-private-headers

ln -sv tclsh8.6 /tools/bin/tclsh


set -eo nounset

cd /sources

for k in \
http://www.nico.schottelius.org/software/gpm/archives/gpm-1.20.7.tar.bz2 \
http://www.linuxfromscratch.org/patches/blfs/svn/gpm-1.20.7-glibc_2.26-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf gpm-1.20.7
tar xf gpm-1.20.7.tar.bz2
pushd  gpm-1.20.7

sed -i -e 's:<gpm.h>:"headers/gpm.h":' src/prog/{display-buttons,display-coords,get-versions}.c &&
patch -Np1 -i ../gpm-1.20.7-glibc_2.26-1.patch &&
./autogen.sh                                &&
./configure --prefix=/usr --sysconfdir=/etc &&
make

make install                                          &&

install-info --dir-file=/usr/share/info/dir           \
             /usr/share/info/gpm.info                 &&

ln -sfv libgpm.so.2.1.0 /usr/lib/libgpm.so            &&
install -v -m644 conf/gpm-root.conf /etc              &&

install -v -m755 -d /usr/share/doc/gpm-1.20.7/support &&
install -v -m644    doc/support/*                     \
                    /usr/share/doc/gpm-1.20.7/support &&
install -v -m644    doc/{FAQ,HACK_GPM,README*}        \
                    /usr/share/doc/gpm-1.20.7

#make install-gpm
/workspace/LFS/LFS3/BLFS/bootscripts.sh gpm

echo TODO
exit 2
# TODO
cat > /etc/sysconfig/mouse << "EOF"
# Begin /etc/sysconfig/mouse

MDEVICE="<yourdevice>"
PROTOCOL="<yourprotocol>"
GPMOPTS="<additional options>"

# End /etc/sysconfig/mouse
EOF

#MDEVICE="/dev/input/mice"
#PROTOCOL="imps2"
#GPMOPTS=""

popd
rm -rf gpm-1.20.7

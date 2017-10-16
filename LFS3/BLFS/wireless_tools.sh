set -eo nounset

cd /sources

for k in \
http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/wireless_tools-29-fix_iwlist_scanning-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf wireless_tools.29
tar xf wireless_tools.29.tar.gz
pushd  wireless_tools.29

patch -Np1 -i ../wireless_tools-29-fix_iwlist_scanning-1.patch

make

make PREFIX=/usr INSTALL_MAN=/usr/share/man install

popd
rm -rf wireless_tools.29

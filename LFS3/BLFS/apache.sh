set -eo nounset

cd /sources

for k in  \
https://archive.apache.org/dist/httpd/httpd-2.4.28.tar.bz2 \
http://www.linuxfromscratch.org/patches/blfs/svn/httpd-2.4.28-blfs_layout-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf httpd-2.4.28
tar xf httpd-2.4.28.tar.bz2
pushd  httpd-2.4.28

groupadd -g 25 apache
useradd -c "Apache Server" -d /srv/www -g apache \
        -s /bin/false -u 25 apache

patch -Np1 -i ../httpd-2.4.28-blfs_layout-1.patch

sed '/dir.*CFG_PREFIX/s@^@#@' -i support/apxs.in

./configure --enable-authnz-fcgi                              \
            --enable-layout=BLFS                              \
            --enable-mods-shared="all cgi"                    \
            --enable-mpms-shared=all                          \
            --enable-suexec=shared                            \
            --with-apr=/usr/bin/apr-1-config                  \
            --with-apr-util=/usr/bin/apu-1-config             \
            --with-suexec-bin=/usr/lib/httpd/suexec           \
            --with-suexec-caller=apache                       \
            --with-suexec-docroot=/srv/www                    \
            --with-suexec-logfile=/var/log/httpd/suexec.log   \
            --with-suexec-uidmin=100                          \
            --with-suexec-userdir=public_html
make

make install

mv -v /usr/sbin/suexec /usr/lib/httpd/suexec
chgrp apache           /usr/lib/httpd/suexec
chmod 4754             /usr/lib/httpd/suexec

chown -v -R apache:apache /srv/www

#make install-httpd
/workspace/LFS/LFS3/BLFS/bootscripts.sh httpd

popd
rm -rf httpd-2.4.28


set -eo nounset

cd /sources

for k in \
http://www.php.net/distributions/php-7.1.10.tar.xz \
http://www.php.net/download-docs.php ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf php-7.1.10
tar xf php-7.1.10.tar.xz
pushd  php-7.1.10

./configure --prefix=/usr                \
            --sysconfdir=/etc            \
            --localstatedir=/var         \
            --datadir=/usr/share/php     \
            --mandir=/usr/share/man      \
            --enable-fpm                 \
            --with-fpm-user=apache       \
            --with-fpm-group=apache      \
            --with-config-file-path=/etc \
            --with-zlib                  \
            --enable-bcmath              \
            --with-bz2                   \
            --enable-calendar            \
            --enable-dba=shared          \
            --with-gdbm                  \
            --with-gmp                   \
            --enable-ftp                 \
            --with-gettext               \
            --enable-mbstring            \
            --with-readline
make

make install
install -v -m644 php.ini-production /etc/php.ini

install -v -m755 -d /usr/share/doc/php-7.1.10
install -v -m644    CODING_STANDARDS EXTENSIONS INSTALL NEWS README* UPGRADING* php.gif \
                    /usr/share/doc/php-7.1.10
ln -v -sfn          /usr/lib/php/doc/Archive_Tar/docs/Archive_Tar.txt \
                    /usr/share/doc/php-7.1.10
ln -v -sfn          /usr/lib/php/doc/Structures_Graph/docs \
                    /usr/share/doc/php-7.1.10
if [ -f /etc/php-fpm.conf.default ]; then
  mv -v /etc/php-fpm.conf{.default,}
  mv -v /etc/php-fpm.d/www.conf{.default,}
fi

install -v -m644 ../php_manual_en.html.gz \
    /usr/share/doc/php-7.1.10
gunzip -v /usr/share/doc/php-7.1.10/php_manual_en.html.gz

tar -xvf ../php_manual_en.tar.gz \
    -C /usr/share/doc/php-7.1.10 --no-same-owner

sed -i 's@php/includes"@&\ninclude_path = ".:/usr/lib/php"@' \
    /etc/php.ini

sed -i -e '/proxy_module/s/^#//'      \
       -e '/proxy_fcgi_module/s/^#//' \
       /etc/httpd/httpd.conf

echo \
'ProxyPassMatch ^/(.*\.php)$ fcgi://127.0.0.1:9000/srv/www/$1' >> \
/etc/httpd/httpd.conf

echo AddType application/x-httpd-php-source .phps >> /etc/httpd/httpd.conf

#make install-php
/workspace/LFS/LFS3/BLFS/bootscripts.sh php

popd
rm -rf php-7.1.10


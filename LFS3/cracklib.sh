cd /sources

test -f cracklib-2.9.6.tar.gz || \
wget --no-check-certificate \
	https://github.com/cracklib/cracklib/releases/download/cracklib-2.9.6/cracklib-2.9.6.tar.gz

test -f cracklib-words-2.9.6.gz || \
wget --no-check-certificate \
	https://github.com/cracklib/cracklib/releases/download/cracklib-2.9.6/cracklib-words-2.9.6.gz

rm -rf cracklib-2.9.6
tar xf cracklib-2.9.6.tar.gz
cd cracklib-2.9.6

sed -i '/skipping/d' util/packer.c

./configure --prefix=/usr    \
            --disable-static \
            --with-default-dict=/lib/cracklib/pw_dict
make

make install
mv -v /usr/lib/libcrack.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libcrack.so) /usr/lib/libcrack.so

install -v -m644 -D    ../cracklib-words-2.9.6.gz \
                         /usr/share/dict/cracklib-words.gz

gunzip -v                /usr/share/dict/cracklib-words.gz
ln -v -sf cracklib-words /usr/share/dict/words
echo $(hostname) >>      /usr/share/dict/cracklib-extra-words
install -v -m755 -d      /lib/cracklib

create-cracklib-dict     /usr/share/dict/cracklib-words \
                         /usr/share/dict/cracklib-extra-words

make test

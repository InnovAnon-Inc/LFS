set -eo nounset

cd /sources

for k in \
https://www.kernel.org/pub/software/scm/git/git-2.14.2.tar.xz \
https://www.kernel.org/pub/software/scm/git/git-manpages-2.14.2.tar.xz \
https://www.kernel.org/pub/software/scm/git/git-htmldocs-2.14.2.tar.xz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf git-2.14.2
tar xf git-2.14.2.tar.xz
pushd  git-2.14.2

./configure --prefix=/usr --with-gitconfig=/etc/gitconfig
make

#make html

#make man

make install

#make install-man

#make htmldir=/usr/share/doc/git-2.14.2 install-html

tar -xf ../git-manpages-2.14.2.tar.xz \
    -C /usr/share/man --no-same-owner --no-overwrite-dir



mkdir -vp   /usr/share/doc/git-2.14.2
tar   -xf   ../git-htmldocs-2.14.2.tar.xz \
      -C    /usr/share/doc/git-2.14.2 --no-same-owner --no-overwrite-dir

find        /usr/share/doc/git-2.14.2 -type d -exec chmod 755 {} \;
find        /usr/share/doc/git-2.14.2 -type f -exec chmod 644 {} \;

mkdir -vp /usr/share/doc/git-2.14.2/man-pages/{html,text}
mv        /usr/share/doc/git-2.14.2/{git*.txt,man-pages/text}
mv        /usr/share/doc/git-2.14.2/{git*.,index.,man-pages/}html

mkdir -vp /usr/share/doc/git-2.14.2/technical/{html,text}
mv        /usr/share/doc/git-2.14.2/technical/{*.txt,text}
mv        /usr/share/doc/git-2.14.2/technical/{*.,}html

mkdir -vp /usr/share/doc/git-2.14.2/howto/{html,text}
mv        /usr/share/doc/git-2.14.2/howto/{*.txt,text}
mv        /usr/share/doc/git-2.14.2/howto/{*.,}html

sed -i '/^<a href=/s|howto/|&html/|' /usr/share/doc/git-2.14.2/howto-index.html
sed -i '/^\* link:/s|howto/|&html/|' /usr/share/doc/git-2.14.2/howto-index.txt

popd
rm -rf git-2.14.2
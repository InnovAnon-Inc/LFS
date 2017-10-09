set -eo nounset

cd /sources

rm -rf gettext-0.19.8.1
tar xf gettext-0.19.8.1.tar.xz
pushd  gettext-0.19.8.1

cd gettext-tools
EMACS="no" ./configure --prefix=/tools --disable-shared

make -C gnulib-lib
make -C intl pluralx.c
make -C src msgfmt
make -C src msgmerge
make -C src xgettext

cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin

popd
rm -rf gettext-0.19.8.1

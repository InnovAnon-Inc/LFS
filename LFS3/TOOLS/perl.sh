set -eo nounset

cd /sources

rm -rf perl-5.26.1
tar xf perl-5.26.1.tar.xz
pushd  perl-5.26.1

sh Configure -des -Dprefix=/tools -Dlibs=-lm

make

cp -v perl cpan/podlators/scripts/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.26.1
cp -Rv lib/* /tools/lib/perl5/5.26.1

popd
rm -rf perl-5.26.1

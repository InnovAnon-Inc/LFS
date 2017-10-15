set -eo nounset

cd /sources

test -f graphite2-1.3.10.tgz || \
wget --no-check-certificate \
	https://github.com/silnrsi/graphite/releases/download/1.3.10/graphite2-1.3.10.tgz

rm -rf graphite2-1.3.10
tar xf graphite2-1.3.10.tgz
pushd  graphite2-1.3.10

sed -i '/cmptest/d' tests/CMakeLists.txt

mkdir build
cd    build

cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make

if `which texlive` ; then
make docs
fi

make install

install -v -d -m755 /usr/share/doc/graphite2-1.3.10

cp      -v -f    doc/{GTF,manual}.html \
                    /usr/share/doc/graphite2-1.3.10
cp      -v -f    doc/{GTF,manual}.pdf \
                    /usr/share/doc/graphite2-1.3.10

popd
rm -rf graphite2-1.3.10


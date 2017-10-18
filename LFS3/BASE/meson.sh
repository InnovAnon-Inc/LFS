set -eo nounset
set +h

cd /sources

rm -rf meson-0.42.1
tar xf meson-0.42.1.tar.gz
pushd  meson-0.42.1

python3 setup.py build

python3 setup.py install

popd
rm -rf meson-0.42.1

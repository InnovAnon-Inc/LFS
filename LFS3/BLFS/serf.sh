set -eo nounset

cd /sources

test -f serf-1.3.9.tar.bz2 || \
wget --no-check-certificate \
	https://archive.apache.org/dist/serf/serf-1.3.9.tar.bz2

rm -rf serf-1.3.9
tar xf serf-1.3.9.tar.bz2
pushd  serf-1.3.9

sed -i "/Append/s:RPATH=libdir,::"          SConstruct
sed -i "/Default/s:lib_static,::"           SConstruct
sed -i "/Alias/s:install_static,::"         SConstruct
sed -i "/  print/{s/print/print(/; s/$/)/}" SConstruct

scons PREFIX=/usr

scons PREFIX=/usr install

popd
rm -rf serf-1.3.9


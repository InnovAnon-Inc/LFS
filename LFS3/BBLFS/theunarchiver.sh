set -eo nounset

cd /sources

test -f TheUnarchiverSource.zip || \
wget --no-check-certificate \
	https://theunarchiver.com/downloads/TheUnarchiverSource.zip

rm -rf TheUnarchiverSource
unzip  TheUnarchiverSource.zip
pushd  TheUnarchiverSource

cd XADMaster

make -f Makefile.linux

popd
rm -rf TheUnarchiverSource

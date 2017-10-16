set -eo nounset

cd /sources

test -f npapi-sdk-0.27.2.tar.bz2 || \
wget --no-check-certificate \
	https://bitbucket.org/mgorny/npapi-sdk/downloads/npapi-sdk-0.27.2.tar.bz2

rm -rf npapi-sdk-0.27.2  
tar xf npapi-sdk-0.27.2.tar.bz2
pushd  npapi-sdk-0.27.2  

./configure --prefix=/usr

make install

popd
rm -rf npapi-sdk-0.27.2  

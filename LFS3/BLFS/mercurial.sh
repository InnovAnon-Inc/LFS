set -eo nounset

cd /sources

test -f mercurial-4.3.3.tar.gz || \
wget --no-check-certificate \
	 https://www.mercurial-scm.org/release/mercurial-4.3.3.tar.gz

rm -rf mercurial-4.3.3
tar xf mercurial-4.3.3.tar.gz
pushd  mercurial-4.3.3

make build

make doc

#rm -rf tests/tmp &&
#TESTFLAGS="-j3 --tmpdir tmp --blacklist blacklists/failed-tests" make check

#pushd tests  &&
#  rm -rf tmp &&
#  ./run-tests.py --tmpdir tmp test-gpg.t
#popd

make PREFIX=/usr install-bin

make PREFIX=/usr install-doc

cat >> ~/.hgrc << "EOF"
[ui]
username = lmaddox <laurence.a.maddox@gmail.com>
EOF

popd
rm -rf mercurial-4.3.3

set -eo nounset

#cd /other-repos || cd /repos
#
#if [ -d lxml ] ; then
#	pushd lxml
#	git reset --hard
#	git clean -d -f -x
#	git pull origin master
#	popd
#else
#	git clone https://github.com/lxml/lxml.git
#fi
#
#cd lxml

cd /sources

test -f lxml-4.0.0.tar.gz || \
wget --no-check-certificate \
	https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.0.0.tar.gz

rm -rf lxml-4.0.0
tar xf lxml-4.0.0.tar.gz
pushd  lxml-4.0.0

python setup.py build
python setup.py install --optimize=1
python3 setup.py clean
python3 setup.py build
python3 setup.py install --optimize=1

popd


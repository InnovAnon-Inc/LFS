set -eo nounset

cd /other-repos || cd /repos

if [ -d pycrypto ] ; then
	pushd pycrypto
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/dlitz/pycrypto.git
fi

cd pycrypto

python setup.py build
python setup.py install --optimize=1
python3 setup.py build
python3 setup.py install --optimize=1

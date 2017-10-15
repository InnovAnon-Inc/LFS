set -eo nounset

cd /other-repos || cd /repos

if [ -d numpy ] ; then
	pushd numpy
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/numpy/numpy.git
fi

cd numpy

python setup.py build
python setup.py install --optimize=1 --prefix=/usr
#python setup.py install --prefix=/usr


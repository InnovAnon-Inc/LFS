set -eo nounset

cd /other-repos || cd /repos

if [ -d pyflakes ] ; then
	pushd pyflakes
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/PyCQA/pyflakes.git
fi

cd pyflakes

#python setup.py install --prefix=/usr
python setup.py build
python setup.py install --optimize=1 --prefix=/usr


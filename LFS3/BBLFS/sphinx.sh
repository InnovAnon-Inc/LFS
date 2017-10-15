set -eo nounset

cd /other-repos || cd /repos

if [ -d sphinx ] ; then
	pushd sphinx
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/sphinx-doc/sphinx.git
fi

cd sphinx

#python setup.py install --prefix=/usr
python setup.py build
python setup.py install --optimize=1 --prefix=/usr


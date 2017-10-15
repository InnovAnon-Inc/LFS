set -eo nounset

cd /other-repos || cd /repos

if [ -d pygments ] ; then
	pushd pygments
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://bitbucket.org/birkenfeld/py.git pygments
fi

cd pygments

#python setup.py install --prefix=/usr
python setup.py build
python setup.py install --optimize=1 --prefix=/usr


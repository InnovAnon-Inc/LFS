set -eo nounset

cd /other-repos || cd /repos

if [ -d pycairo ] ; then
	pushd pycairo
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/pygobject/pycairo.git
fi

cd pycairo

python2 setup.py build
python2 setup.py install --optimize=1
python3 setup.py build
python3 setup.py install --optimize=1

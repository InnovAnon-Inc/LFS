set -eo nounset

cd /other-repos || cd /repos

if [ -d funcsigs ] ; then
	pushd funcsigs
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/testing-cabal/funcsigs.git
fi

cd funcsigs

python setup.py install --optimize=1 --prefix=/usr


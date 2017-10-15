set -eo nounset

cd /other-repos || cd /repos

if [ -d beaker ] ; then
	pushd beaker
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/bbangert/beaker.git
fi

cd beaker

python setup.py install --optimize=1 --prefix=/usr
python3 setup.py install --optimize=1 --prefix=/usr


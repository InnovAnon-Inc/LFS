set -eo nounset

cd /other-repos || cd /repos

if [ -d markupsafe ] ; then
	pushd markupsafe
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/pallets/markupsafe.git
fi

cd markupsafe

python setup.py build
python setup.py install --optimize=1 --prefix=/usr
python3 setup.py build
python3 setup.py install --optimize=1 --prefix=/usr


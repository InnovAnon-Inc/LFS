set -eo nounset

cd /other-repos || cd /repos

if [ -d urllib3 ] ; then
	pushd urllib3
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/shazow/urllib3.git
fi

cd urllib3

python setup.py install --optimize=1 --prefix=/usr
python3 setup.py install --optimize=1 --prefix=/usr


set -eo nounset

cd /other-repos || cd /repos

if [ -d scour ] ; then
	pushd scour
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/scour-project/scour.git
fi

cd scour

python setup.py build
python setup.py install --optimize=1


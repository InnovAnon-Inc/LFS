set -eo nounset

cd /other-repos || cd /repos

if [ -d pyxdg ] ; then
	pushd pyxdg
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/takluyver/pyxdg.git
fi

cd pyxdg

python  setup.py install --optimize=1
python3 setup.py install --optimize=1


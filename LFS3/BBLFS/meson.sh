set -eo nounset

cd /other-repos || cd /repos

if [ -d meson ] ; then
	pushd meson
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/mesonbuild/meson.git
fi

cd meson

python3 setup.py build
python3 setup.py install --optimize=1 --prefix=/usr

#python setup.py build
#python setup.py install --optimize=1 --prefix=/usr

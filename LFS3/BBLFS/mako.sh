set -eo nounset

cd /other-repos || cd /repos

if [ -d mako ] ; then
	pushd mako
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/zzzeek/mako.git
fi

cd mako

python setup.py build
python setup.py install --optimize=1 --prefix=/usr
#python setup.py install --prefix=/usr

sed -i "s:mako-render:&3:g" setup.py &&
python3 setup.py install --optimize=1

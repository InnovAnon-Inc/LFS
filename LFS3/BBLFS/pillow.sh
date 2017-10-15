set -eo nounset

cd /other-repos || cd /repos

if [ -d Pillow ] ; then
	pushd Pillow
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/python-pillow/Pillow.git
fi

cd Pillow

#python setup.py install --prefix=/usr
python setup.py build
python setup.py install --optimize=1 --prefix=/usr

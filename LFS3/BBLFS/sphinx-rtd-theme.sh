set -eo nounset

cd /other-repos || cd /repos

if [ -d sphinx_rtd_theme ] ; then
	pushd sphinx_rtd_theme
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/rtfd/sphinx_rtd_theme.git
fi

cd sphinx_rtd_theme

#python setup.py install --prefix=/usr
python setup.py build
python setup.py install --optimize=1 --prefix=/usr


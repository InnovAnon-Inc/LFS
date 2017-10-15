set -eo nounset

cd /other-repos || cd /repos

if [ -d six ] ; then
	pushd six
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/benjaminp/six.git
fi

cd six

for P in python2 python3 ; do
$P setup.py build
$P setup.py install --optimize=1 --prefix=/usr
#$P setup.py install --prefix=/usr
done


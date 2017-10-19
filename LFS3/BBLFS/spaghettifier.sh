set -eo nounset

cd /other-repos || cd /repos

if [ -d spaghettifier ] ; then
	pushd spaghettifier
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/EinBaum/spaghettifier.git
fi

cd spaghettifier

install -vdm0755 /var/www/spaghettifier
install -vm0644 index.html script.js style.css \
	/var/www/spaghettifier

set -eo nounset

cd /other-repos || cd /repos

if [ -d multigit ] ; then
	pushd multigit
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/capr/multigit.git
fi

cd multigit

install -vm755 mgit /usr/local/bin/
install -vm755 mgit-autocomplete.sh /etc/bash_completion.d/mgit


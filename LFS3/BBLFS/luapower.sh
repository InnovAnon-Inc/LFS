set -eo nounset

cd /other-repos || cd /repos

if [ -d luapower ] ; then
	pushd luapower
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	mkdir luapower
	pushd luapower
	mgit clone https://github.com/luapower/luapower-repos.git luapower
	mgit clone-all
	popd
fi

cd luapower

ls
exit 2

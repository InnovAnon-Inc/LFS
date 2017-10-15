set -eo nounset

test x`whoami` != xroot

#cd ~/.irssi
cd ~/repos

if [ -d scripts.irssi.org ] ; then
	#pushd scripts
	#git reset --hard
	#git clean -d -f -x
	#git pull origin master
	#popd
	echo do nothing
else
	git clone https://github.com/irssi/scripts.irssi.org.git
fi

#cd scripts
rm -f ~/.irssi/scripts
ln -s ~/repos/scripts.irssi.org/scripts ~/.irssi/scripts

#./autogen.sh
#./configure
#make
#make install

set -eo nounset

cd /other-repos || cd /repos

if [ -d linux ] ; then
        pushd linux
        git reset --hard
        git clean -d -f -x
        git pull origin master
        popd
else
        git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
fi

cd linux

make mrproper

make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include

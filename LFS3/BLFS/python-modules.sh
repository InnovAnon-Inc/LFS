set -eo nounset

for k in \
dbus-python \
pyatspi \
pycairo \
pycrypto \
pygobject \
pygobject3 \
pygtk \
pyxdg \
funcsigs \
beaker \
lxml \
markupsafe \
mako \
scour \
six ; do
	if [ -e /workspace/LFS/LFS3/BLFS/$k.sh ] ; then
		/workspace/LFS/LFS3/BLFS/$k.sh
	else
		/workspace/LFS/LFS3/BBLFS/$k.sh
	fi
done

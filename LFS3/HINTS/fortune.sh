set -eo nounset

cd /sources

test -f fortune-mod-9708.tar.gz || \
wget --no-check-certificate \
	http://www.ibiblio.org/pub/Linux/games/amusements/fortune/fortune-mod-9708.tar.gz

rm -rf fortune-mod-9708
tar xf fortune-mod-9708.tar.gz
pushd  fortune-mod-9708

make
make OFFENSIVE=1 install-cookie
make FORTDIR="/usr/bin" install

popd
rm -rf fortune-mod-9708

test -e /etc/rc.d/init.d/motd || \
cat > /etc/rc.d/init.d/motd << "EOF"
#!/bin/bash
# Begin $rc_base/init.d/motd

source /etc/sysconfig/rc
source $rc_functions

case "$1" in
        start|stop)
                echo "Setting motd (fortune)"
                fortune >/etc/motd 2>&1
	        evaluate_retval
	        ;;
        *)
		echo "Usage: $0 {start}"
	 	exit 1
		;;
esac

# End $rc_base/init.d/motd
EOF
chmod 755 /etc/rc.d/init.d/motd

ln /etc/rc.d/init.d/motd /etc/rc.d/rc3.d/S36motd -sv &&
ln /etc/rc.d/init.d/motd /etc/rc.d/rc4.d/S36motd -sv &&
ln /etc/rc.d/init.d/motd /etc/rc.d/rc5.d/S36motd -sv

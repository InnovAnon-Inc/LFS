set -eo nounset

cd /sources

test -f dbus-1.10.22.tar.gz || \
wget --no-check-certificate \
	https://dbus.freedesktop.org/releases/dbus/dbus-1.10.22.tar.gz

rm -rf dbus-1.10.22
tar xf dbus-1.10.22.tar.gz
pushd  dbus-1.10.22

./configure --prefix=/usr                        \
            --sysconfdir=/etc                    \
            --localstatedir=/var                 \
            --enable-user-session                \
            --disable-doxygen-docs               \
            --disable-xml-docs                   \
            --disable-static                     \
            --docdir=/usr/share/doc/dbus-1.10.22 \
            --with-console-auth-dir=/run/console \
            --with-system-pid-file=/run/dbus/pid \
            --with-system-socket=/run/dbus/system_bus_socket &&
make

#systemctl start rescue.target

make install

mv -v /usr/lib/libdbus-1.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libdbus-1.so) /usr/lib/libdbus-1.so

chown -v root:messagebus /usr/libexec/dbus-daemon-launch-helper &&
chmod -v      4750       /usr/libexec/dbus-daemon-launch-helper

#systemctl daemon-reload
#systemctl start multi-user.target

#make distclean                     &&
#./configure --enable-tests         \
#            --enable-asserts       \
#            --disable-doxygen-docs \
#            --disable-xml-docs     &&
#make                               &&
#make check

test -e /etc/dbus-1/session-local.conf || \
cat > /etc/dbus-1/session-local.conf << "EOF"
<!DOCTYPE busconfig PUBLIC
 "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
<busconfig>

  <!-- Search for .service files in /usr/local -->
  <servicedir>/usr/local/share/dbus-1/services</servicedir>

</busconfig>
EOF

#echo dbus-launch >> ~/.xinitrc

#echo dbus-launch >> ~/.xsession

#cat >> ??? << "EOF"
## Start the D-Bus session daemon
#eval `dbus-launch`
#export DBUS_SESSION_BUS_ADDRESS
#EOF

#cat >> ~/.bash_logout << "EOF"
## Kill the D-Bus session daemon
#kill $DBUS_SESSION_BUS_PID
#EOF

popd
rm -rf dbus-1.10.22

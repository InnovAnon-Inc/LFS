set -eo nounset

cd /sources

test -f wpa_supplicant-2.6.tar.gz || \
wget --no-check-certificate \
	https://w1.fi/releases/wpa_supplicant-2.6.tar.gz

rm -rf wpa_supplicant-2.6
tar xf wpa_supplicant-2.6.tar.gz
pushd  wpa_supplicant-2.6

cat > wpa_supplicant/.config << "EOF"
CONFIG_BACKEND=file
CONFIG_CTRL_IFACE=y
CONFIG_DEBUG_FILE=y
CONFIG_DEBUG_SYSLOG=y
CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
CONFIG_DRIVER_NL80211=y
CONFIG_DRIVER_WEXT=y
CONFIG_DRIVER_WIRED=y
CONFIG_EAP_GTC=y
CONFIG_EAP_LEAP=y
CONFIG_EAP_MD5=y
CONFIG_EAP_MSCHAPV2=y
CONFIG_EAP_OTP=y
CONFIG_EAP_PEAP=y
CONFIG_EAP_TLS=y
CONFIG_EAP_TTLS=y
CONFIG_IEEE8021X_EAPOL=y
CONFIG_IPV6=y
CONFIG_LIBNL32=y
CONFIG_PEERKEY=y
CONFIG_PKCS12=y
CONFIG_READLINE=y
CONFIG_SMARTCARD=y
CONFIG_WPS=y
CFLAGS += -I/usr/include/libnl3
EOF

#cat >> wpa_supplicant/.config << "EOF"
#CONFIG_CTRL_IFACE_DBUS=y
#CONFIG_CTRL_IFACE_DBUS_NEW=y
#CONFIG_CTRL_IFACE_DBUS_INTRO=y
#EOF

cd wpa_supplicant &&
make BINDIR=/sbin LIBDIR=/lib

#pushd wpa_gui-qt4 &&
#qmake wpa_gui.pro &&
#make &&
#popd

install -v -m755 wpa_{cli,passphrase,supplicant} /sbin/ &&
install -v -m644 doc/docbook/wpa_supplicant.conf.5 /usr/share/man/man5/ &&
install -v -m644 doc/docbook/wpa_{cli,passphrase,supplicant}.8 /usr/share/man/man8/

install -v -m644 dbus/fi.{epitest.hostap.WPASupplicant,w1.wpa_supplicant1}.service \
                 /usr/share/dbus-1/system-services/ &&
install -v -d -m755 /etc/dbus-1/system.d &&
install -v -m644 dbus/dbus-wpa_supplicant.conf \
                 /etc/dbus-1/system.d/wpa_supplicant.conf

systemctl enable wpa_supplicant

install -v -m755 wpa_gui-qt4/wpa_gui /usr/bin/ &&
install -v -m644 doc/docbook/wpa_gui.8 /usr/share/man/man8/ &&
install -v -m644 wpa_gui-qt4/wpa_gui.desktop /usr/share/applications/ &&
install -v -m644 wpa_gui-qt4/icons/wpa_gui.svg /usr/share/pixmaps/

update-desktop-database

install -v -dm755 /etc/wpa_supplicant &&
wpa_passphrase SSID SECRET_PASSWORD > /etc/wpa_supplicant/wpa_supplicant-wifi0.conf

cat >> /etc/wpa_supplicant/wpa_supplicant-wifi0.conf << "EOF"
network={
  ssid="Some-SSID"
  key_mgmt=NONE
}
EOF

cat >> /etc/wpa_supplicant/wpa_supplicant-wifi0.conf << "EOF"
ctrl_interface=DIR=/run/wpa_supplicant GROUP=<privileged group>
update_config=1
EOF

systemctl start wpa_supplicant@wlan0

systemctl enable wpa_supplicant@wlan0

popd
rm -rf wpa_supplicant-2.6

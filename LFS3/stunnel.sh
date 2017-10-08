cd /sources

test -f stunnel-5.42.tar.gz || \
wget --no-check-certificate \
	ftp://ftp.stunnel.org/stunnel/archive/5.x/stunnel-5.42.tar.gz

rm -rf stunnel-5.42
tar xf stunnel-5.42.tar.gz
cd stunnel-5.42

groupadd -g 51 stunnel
useradd -c "stunnel Daemon" -d /var/lib/stunnel \
        -g stunnel -s /bin/false -u 51 stunnel

# TODO copy key to /etc/stunnel/stunnel.pem

sed -i '/LDFLAGS.*static_flag/ s/^/#/' configure

./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --localstatedir=/var \
            --disable-systemd
make

make docdir=/usr/share/doc/stunnel-5.42 install

#make cert

install -v -m750 -o stunnel -g stunnel -d /var/lib/stunnel/run
chown stunnel:stunnel /var/lib/stunnel

cat >/etc/stunnel/stunnel.conf << "EOF"
; File: /etc/stunnel/stunnel.conf

; Note: The pid and output locations are relative to the chroot location.

pid    = /run/stunnel.pid
chroot = /var/lib/stunnel
client = no
setuid = stunnel
setgid = stunnel
cert   = /etc/stunnel/stunnel.pem

;debug = 7
;output = stunnel.log

;[https]
;accept  = 443
;connect = 80
;; "TIMEOUTclose = 0" is a workaround for a design flaw in Microsoft SSL
;; Microsoft implementations do not use SSL close-notify alert and thus
;; they are vulnerable to truncation attacks
;TIMEOUTclose = 0

EOF

make install-stunnel

set -eo nounset

cd /sources

test -f systemd-234.tar.gz || \
wget --no-check-certificate \
	https://github.com/systemd/systemd/archive/v234/systemd-234.tar.gz

rm -rf systemd-234
tar xf systemd-234.tar.gz
pushd  systemd-234

export PYTHONIOENCODING=utf-8

meson --prefix /usr                   \
      --sysconfdir /etc               \
      --localstatedir /var            \
      -Dblkid=true                    \
      -Dbuildtype=release             \
      -Ddefault-dnssec=no             \
      -Dfirstboot=false               \
      -Dldconfig=false                \
      -Drootprefix=                   \
      -Drootlibdir=/lib               \
      -Dsplit-usr=true                \
      -Dsysusers=false                \
      -Db_lto=false                   \
      $PWD build                      &&
cd build                              &&
ninja

#systemctl start rescue.target

ninja install

rm -rfv /usr/lib/rpm

cat >> /etc/pam.d/system-session << "EOF"
# Begin Systemd addition
    
session   required    pam_loginuid.so
session   optional    pam_systemd.so

# End Systemd addition
EOF

cat > /etc/pam.d/systemd-user << "EOF"
# Begin /etc/pam.d/systemd-user

account  required pam_access.so
account  include  system-account

session  required pam_env.so
session  required pam_limits.so
session  include  system-session

auth     required pam_deny.so
password required pam_deny.so

# End /etc/pam.d/systemd-user
EOF

#systemctl daemon-reload
#systemctl start multi-user.target

# TODO update initrd

popd
rm -rf systemd-234

set -eo nounset

cd /sources

test -f sudo-1.8.21p2.tar.gz || \
wget --no-check-certificate \
	http://www.sudo.ws/dist/sudo-1.8.21p2.tar.gz

rm -rf sudo-1.8.21p2
tar xf sudo-1.8.21p2.tar.gz
pushd  sudo-1.8.21p2

./configure --prefix=/usr              \
            --libexecdir=/usr/lib      \
            --with-secure-path         \
            --with-all-insults         \
            --with-env-editor          \
            --docdir=/usr/share/doc/sudo-1.8.21p2 \
            --with-passprompt="[sudo] password for %p: "
make

make install
ln -sfv libsudo_util.so.0.0.0 /usr/lib/sudo/libsudo_util.so.0

cat >> /etc/sudoers << "EOF"
# User alias specification
#User_Alias  ADMIN = YourLoginId

# Allow people in group ADMIN to run all commands without a password
#ADMIN       ALL = NOPASSWD: ALL
EOF

cat > /etc/pam.d/sudo << "EOF"
# Begin /etc/pam.d/sudo

# include the default auth settings
auth      include     system-auth

# include the default account settings
account   include     system-account

# Set default environment variables for the service user
session   required    pam_env.so

# include system session defaults
session   include     system-session

# End /etc/pam.d/sudo
EOF
chmod 644 /etc/pam.d/sudo

popd
rm -rf sudo-1.8.21p2


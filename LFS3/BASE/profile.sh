set -eo nounset
set +h

test -e /etc/profile || \
cat > /etc/profile << "EOF"
# Begin /etc/profile

export LANG=en_US.utf8

# End /etc/profile
EOF

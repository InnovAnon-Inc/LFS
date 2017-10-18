set -eo nounset
set +h

test -e /etc/lfs-release || \
echo SVN-20170924 > /etc/lfs-release

test -e /etc/lsb-release || \
cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="SVN-20170924"
DISTRIB_CODENAME="InnovAnon, Inc. (Ministries)"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

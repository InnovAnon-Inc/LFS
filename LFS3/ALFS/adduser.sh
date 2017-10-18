set -eo nounset

test $# -ne 0

for k in lfs $1 ; do
grep -q $1 /etc/passwd || \
groupadd $1
done

useradd -s /bin/bash -g $1 -G lfs -m -k /dev/null $1

#passwd $1

chown -R $1:lfs $LFS/tools
chown -R $1:lfs $SRCS


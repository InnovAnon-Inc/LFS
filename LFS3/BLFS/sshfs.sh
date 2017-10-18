set -eo nounset

cd /sources

test -f sshfs-3.2.0.tar.gz || \
wget --no-check-certificate \
	https://github.com/libfuse/sshfs/releases/download/sshfs-3.2.0/sshfs-3.2.0.tar.gz

rm -rf sshfs-3.2.0
tar xf sshfs-3.2.0.tar.gz
pushd  sshfs-3.2.0

./configure --prefix=/usr &&
make

make install

#sshfs example.com:/home/userid ~/examplepath

#fusermount -u ~/example

#userid@example.com:/path /media/path fuse.sshfs  _netdev,IdentityFile=/home/userid/.ssh/id_rsa 0 0

popd
rm -rf sshfs-3.2.0

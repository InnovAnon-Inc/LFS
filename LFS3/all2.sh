set -eo nounset

MNT=/mnt/lfs

chown -v -R lfs:lfs $MNT/sources

rm -rf /tools $MNT/tools
mkdir $MNT/tools
chown -v lfs:lfs $MNT/tools
chmod -v a+wt $MNT/tools
ln -v -s $MNT/tools /tools

su - lfs << EOF2
source \$HOME/.bashrc
cd /workspace/LFS/LFS3/TOOLS
./tools.sh
EOF2

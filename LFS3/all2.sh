set -eo nounset

export LFS=/mnt/lfs

chown -v -R lfs:lfs $LFS/sources

rm -rf /tools $LFS/tools
mkdir -v $LFS/tools
chown -v lfs:lfs $LFS/tools
chmod -v a+wt $LFS/tools
ln -v -s $LFS/tools /tools

su - lfs << EOF2
source \$HOME/.bashrc
cd /workspace/LFS/LFS3/TOOLS
./tools.sh
EOF2

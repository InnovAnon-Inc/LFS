set -eo nounset

cd /sources

test -f sysstat-11.6.0.tar.xz || \
wget --no-check-certificate \
	http://perso.wanadoo.fr/sebastien.godard/sysstat-11.6.0.tar.xz

rm -rf sysstat-11.6.0
tar xf sysstat-11.6.0.tar.xz
pushd  sysstat-11.6.0

sa_lib_dir=/usr/lib/sa    \
sa_dir=/var/log/sa        \
conf_dir=/etc/sysconfig   \
./configure --prefix=/usr \
            --disable-file-attr &&
make

make install

cat << "EOF" | EDITOR=cat crontab -e
# 8am-7pm activity reports every 10 minutes during weekdays
0 8-18 * * 1-5 /usr/lib/sa/sa1 600 6 &

# 7pm-8am activity reports every hour during weekdays
0 19-7 * * 1-5 /usr/lib/sa/sa1 &

# Activity reports every hour on Saturday and Sunday
0 * * * 0,6 /usr/lib/sa/sa1 &

# Daily summary prepared at 19:05
5 19 * * * /usr/lib/sa/sa2 -A &
EOF

/workspace/LFS/LFS3/BLFS/bootscripts.sh sysstat

popd
rm -rf sysstat-11.6.0

set -eo nounset

test -e /usr/lib/distcc || \
install -vdm0755 /usr/lib/distcc

cd /usr/local/bin
for k in *cc* *c++* *cxx* ; do
test x$k != xdistcc || continue
test -f $k || continue
rm -f /usr/lib/distcc/{x86_64-pc-linux-gnu-,}$k
ln -v -s /usr/local/bin/distcc /usr/lib/distcc/x86_64-pc-linux-gnu-$k
ln -v -s /usr/local/bin/distcc /usr/lib/distcc/$k
done

cd /usr/bin
for k in *cc* *c++* *cxx* ; do
test x$k != xdistcc || continue
test -f $k || continue
rm -f /usr/lib/distcc/{x86_64-pc-linux-gnu-,}$k
ln -v -s /usr/local/bin/distcc /usr/lib/distcc/x86_64-pc-linux-gnu-$k
ln -v -s /usr/local/bin/distcc /usr/lib/distcc/$k
done



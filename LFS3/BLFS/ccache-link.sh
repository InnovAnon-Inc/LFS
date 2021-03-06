set -eo nounset

test -d /usr/lib/ccache || \
install -vdm0755 /usr/lib/ccache

cd /usr/local/bin
for k in *cc* *c++* *cxx* ; do
test x$k != xccache || continue
test -f $k || continue
rm -f /usr/lib/ccache/{x86_64-pc-linux-gnu-,}$k
ln -v -s /usr/local/bin/ccache /usr/lib/ccache/x86_64-pc-linux-gnu-$k
ln -v -s /usr/local/bin/ccache /usr/lib/ccache/$k
done

cd /usr/bin
for k in *cc* *c++* *cxx* ; do
test x$k != xccache || continue
test -f $k || continue
rm -f /usr/lib/ccache/{x86_64-pc-linux-gnu-,}$k
ln -v -s /usr/local/bin/ccache /usr/lib/ccache/x86_64-pc-linux-gnu-$k
ln -v -s /usr/local/bin/ccache /usr/lib/ccache/$k
done



set -eo nounset

wget -O- http://www.linuxfromscratch.org/~dj/Python | \
awk '{print $1}' | \
xargs rm -rf

wget -O- http://www.linuxfromscratch.org/~dj/Python | \
awk '{print $1}' | \
sed 's@/usr@/usr/local@' | \
xargs rm -rf

#rm -rf /usr/lib/pkgconfig/python*

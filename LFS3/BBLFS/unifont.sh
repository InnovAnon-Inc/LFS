set -eo nounset

cd /sources

test -f unifont-9.0.06.pcf.gz || \
wget --no-check-certificate \
	http://unifoundry.com/pub/unifont-9.0.06/font-builds/unifont-9.0.06.pcf.gz

mkdir -pv /usr/share/fonts/unifont
gunzip -c /sources/unifont-9.0.06.pcf.gz > \
         /usr/share/fonts/unifont/unifont.pcf

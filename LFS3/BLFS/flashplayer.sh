set -eo nounset

cd /sources

for k in \
https://fpdownload.adobe.com/pub/flashplayer/pdc/26.0.0.151/flash_player_npapi_linux.x86_64.tar.gz \
https://fpdownload.adobe.com/pub/flashplayer/pdc/26.0.0.151/flash_player_ppapi_linux.x86_64.tar.gz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

test -f chromium-launcher-v5.tar.gz || \
wget https://github.com/foutrelis/chromium-launcher/archive/v5.tar.gz \
     -O chromium-launcher-v5.tar.gz

rm -rf chromium-launcher-v5
tar xf chromium-launcher-v5.tar.gz
pushd  chromium-launcher-v5

mkdir flashplayer &&
cd flashplayer    &&
case $(uname -m) in
    x86_64) tar -xf ../flash_player_npapi_linux.x86_64.tar.gz
    ;;
    i?86)   tar -xf ../flash_player_npapi_linux.i386.tar.gz
    ;;
esac

install -vdm755 /usr/lib/mozilla/plugins &&
install -vm755 libflashplayer.so /usr/lib/mozilla/plugins/libflashplayer.so &&
install -vm755 usr/bin/flash-player-properties /usr/bin &&
install -vm644 usr/share/applications/flash-player-properties.desktop \
               /usr/share/applications &&
for size in 16 22 24 32 48
do
    install -vdm755 usr/share/icons/hicolor/${size}x${size}/apps/ &&
    install -vm644 usr/share/icons/hicolor/${size}x${size}/apps/flash-player-properties.png \
                   /usr/share/icons/hicolor/${size}x${size}/apps
done &&
update-desktop-database

mkdir flashplayer &&
cd flashplayer    &&
case $(uname -m) in
    x86_64) tar -xf ../flash_player_ppapi_linux.x86_64.tar.gz
    ;;
    i?86)   tar -xf ../flash_player_ppapi_linux.i386.tar.gz
    ;;
esac

install -vdm755 /usr/lib/PepperFlash &&
install -vDm755 libpepflashplayer.so /usr/lib/PepperFlash/ &&
install -vm644 manifest.json /usr/lib/PepperFlash/

tar -xf chromium-launcher-5.tar.gz &&
cd chromium-launcher-5             &&
make PREFIX=/usr

mv -v /usr/bin/chromium /usr/bin/chromium-orig &&
make PREFIX=/usr install-strip

popd
rm -rf chromium-launcher-v5

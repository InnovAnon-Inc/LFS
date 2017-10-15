set -eo nounset

cd /sources

for k in \
http://downloads.sourceforge.net/opencvlibrary/opencv-3.3.0.zip \
http://raw.githubusercontent.com/opencv/opencv_3rdparty/a62e20676a60ee0ad6581e217fe7e4bada3b95db/ippicv/ippicv_2017u2_lnx_intel64_20170418.tgz \
http://github.com/opencv/opencv_contrib/archive/3.3.0/opencv_contrib-3.3.0.tar.gz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf opencv-3.3.0
unzip  opencv-3.3.0.zip
pushd  opencv-3.3.0

ipp_file=ippicv_2017u2_lnx_intel64_20170418.tgz &&
ipp_hash=$(md5sum ../$ipp_file | cut -d" " -f1) &&
ipp_dir=.cache/ippicv                           &&

mkdir -p $ipp_dir &&
cp ../$ipp_file $ipp_dir/$ipp_hash-$ipp_file

tar xf ../opencv_contrib-3.3.0.tar.gz

mkdir build &&
cd    build &&

cmake -DCMAKE_INSTALL_PREFIX=/usr      \
      -DCMAKE_BUILD_TYPE=Release       \
      -DENABLE_CXX11=ON                \
      -DBUILD_PERF_TESTS=OFF           \
      -DWITH_XINE=ON                   \
      -DBUILD_TESTS=OFF                \
      -DENABLE_PRECOMPILED_HEADERS=OFF \
      -DCMAKE_SKIP_RPATH=ON            \
      -DBUILD_WITH_DEBUG_INFO=OFF      \
      -Wno-dev  ..                     &&
make

make install             &&

case $(uname -m) in
  x86_64) ARCH=intel64 ;;
       *) ARCH=ia32    ;;
esac                     &&

cp -v 3rdparty/ippicv/ippicv_lnx/lib/$ARCH/libippicv.a /usr/lib &&
unset ARCH

popd
rm -rf opencv-3.3.0

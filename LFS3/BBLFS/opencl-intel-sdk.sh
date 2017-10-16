set -eo nounset

cd /sources

# TODO add download

rm -rf intel_sdk_for_opencl_2017_7.0.0.2511_x64
tar xf intel_sdk_for_opencl_2017_7.0.0.2511_x64.tgz
pushd  intel_sdk_for_opencl_2017_7.0.0.2511_x64

TGT_DIR="/opt/intel-opencl-icd-7.0/lib"
#TGT_DIR=/usr/local/intel-opencl-icd-7.0/lib
mkdir -p "$TGT_DIR"
rpm2cpio opencl-*-intel/cpu-*.x86_64.rpm | cpio -idmv
cp ./opt/intel/opencl-*/lib64/* "$TGT_DIR"
echo "$TGT_DIR/libintelocl.so" > /etc/OpenCL/vendors/intel.icd

popd
rm -rf intel_sdk_for_opencl_2017_7.0.0.2511_x64

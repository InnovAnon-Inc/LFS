set -eo nounset

cd /sources

# TODO add download

rm -rf opencl_runtime_16.1.1_x64_ubuntu_6.4.0.25
tar xf opencl_runtime_16.1.1_x64_ubuntu_6.4.0.25.tgz
pushd  opencl_runtime_16.1.1_x64_ubuntu_6.4.0.25

./install.sh

popd
rm -rf opencl_runtime_16.1.1_x64_ubuntu_6.4.0.25

TGT_DIR=/opt/intel/opencl-1.2-6.4.0.25/lib64
echo $TGT_DIR/libOpenCL.so > /etc/OpenCL/vendors/intel.icd

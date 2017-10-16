set -eo nounset

cd /other-repos || cd /repos

if [ -d OpenCL-Headers ] ; then
	pushd OpenCL-Headers
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/KhronosGroup/OpenCL-Headers.git
fi

cd OpenCL-Headers

TGT_DIR=/usr/local/include/CL
rm -rf   $TGT_DIR
cp -r opencl22/CL $TGT_DIR

#TGT_DIR=/opt/opencl-headers/include/CL
#
#mkdir -p $TGT_DIR
#cd $TGT_DIR
#wget https://raw.githubusercontent.com/KhronosGroup/OpenCL-Headers/master/opencl22/CL/{opencl,cl_platform,cl,cl_ext,cl_gl,cl_gl_ext}.h

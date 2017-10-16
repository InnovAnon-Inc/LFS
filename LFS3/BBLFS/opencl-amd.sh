set -eo nounset

cd /sources

exit 2

# TODO add download
rm -rf ???
tar xf ???
pushd  ???

./AMD-APP-SDK-V3.0.130.136-GA-linux64.sh

popd
rm -rf ???



# TODO add download

rm -rf ???
tar xf ???
pushd  ???

bash ./amd-driver-installer-catalyst-*.run --extract .

TGT_DIR="/opt/amd-opencl-icd-VERSION.MINOR/lib"
mkdir -p "$TGT_DIR"
cp ./arch/x86_64/usr/lib64/* "$TGT_DIR"
echo "$TGT_DIR/libamdocl64.so" > /etc/OpenCL/vendors/amd.icd

#TGT_DIR="/opt/amd-opencl-icd-VERSION.MINOR/lib"
#mkdir -p "$TGT_DIR"
#cp ./arch/x86/usr/lib/* "$TGT_DIR"
#echo "$TGT_DIR/libamdocl32.so" > /etc/OpenCL/vendors/amd.icd

grep -q amdgpu /etc/group || \
addgroup amdgpu

cat > /etc/enable-amd-compute << "HEREFILE"
#! /bin/bash
XAUTHPORT=$(echo $DISPLAY | cut -d'.' -f1 |  cut -d':' -f2)
xauth extract /tmp/x11-auth-file ":$XAUTHPORT"
chmod 660 /tmp/x11-auth-file
chgrp amdgpu /tmp/x11-auth-file

cat > /tmp/enable-amd-compute <<EOF
export COMPUTE=$DISPLAY
unset DISPLAY
export XAUTHORITY=/tmp/x11-auth-file
EOF
HEREFILE

# TODO append to X11 DM init script
/etc/enable-amd-compute

cat >> /etc/gdm3/Init/Default << "EOF"
display-setup-script = /etc/enable-amd-compute
EOF

# to run remotely
#source /tmp/enable-amd-compute

if [ -d /etc/lightdm ] ; then
cat >> /etc/lightdm/lightdm.conf << "EOF"
xserver-allow-tcp=true
#autologin-user=USERNAME #optional
EOF
fi

aticonfig --initial --adapter=all

#setfacl -m g:gpu:rw /dev/nvidia*

popd
rm -rf ???

set -eo nounset

cd /sources

# TODO use a system group number
#grep -q gpu /etc/group || \
#groupadd gpu

#setfacl -m g:gpu:rw /dev/nvidia*

./NVIDIA-Linux-x86_64-387.12.run


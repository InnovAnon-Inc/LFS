#! /bin/bash
set -eo nounset

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

./LFS-2.5-Creating-a-File-System-on-the-Partition0
trap "./LFS-2.5-Creating-a-File-System-on-the-Partition0" 0
./LFS-2.5-Creating-a-File-System-on-the-Partition

./LFS-2.7-Mounting-the-New-Partition
./LFS-3.1-Introduction
./LFS-4.2-Creating-the-LFS-tools-Directory
./LFS-4.3-Adding-the-LFS-User
./LFS-4.3-Adding-the-LFS-User1 $D/LFS-4.4-Setting-Up-the-Environment
# unnecessary: LFS-4.4-Setting-Up-the-Environment1
./LFS-4.3-Adding-the-LFS-User1 $D/LFS-5.3-General-Compilation-Instructions
./LFS-4.3-Adding-the-LFS-User1 $D/LFS-5.3+
./LFS-4.3-Adding-the-LFS-User1 $D/LFS-5.36-Stripping
./LFS-4.3-Adding-the-LFS-User1 $D/LFS-5.37-Changing-Ownership
# TODO backup /tools
./LFS-6.2-Preparing-Virtual-Kernel-File-Systems0
trap "./LFS-6.2-Preparing-Virtual-Kernel-File-Systems0" 0
./LFS-6.2-Preparing-Virtual-Kernel-File-Systems
./LFS-6.4-Entering-the-Chroot-Environment $D/

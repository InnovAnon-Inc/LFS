#! /bin/sh
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
./LFS-4.3-Adding-the-LFS-User1 $D/LFS-5.4+.sh


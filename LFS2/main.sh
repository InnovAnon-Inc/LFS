#! /bin/sh
set -eo nounset

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

sh ./LFS-2.5-Creating-a-File-System-on-the-Partition0
trap "sh ./LFS-2.5-Creating-a-File-System-on-the-Partition0" 0
sh ./LFS-2.5-Creating-a-File-System-on-the-Partition

sh ./LFS-2.7-Mounting-the-New-Partition
sh ./LFS-3.1-Introduction
sh ./LFS-4.2-Creating-the-LFS-tools-Directory
sh ./LFS-4.3-Adding-the-LFS-User
sh ./LFS-4.3-Adding-the-LFS-User1 $D/LFS-4.4-Setting-Up-the-Environment
# unnecessary: LFS-4.4-Setting-Up-the-Environment1
sh ./LFS-4.3-Adding-the-LFS-User1 $D/LFS-5.3-General-Compilation-Instructions


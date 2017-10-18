set -eo nounset
set +h

./bootscripts.sh
./symlinks.sh
./network.sh
./usage.sh
./profile.sh
./inputrc.sh
./etcshells.sh
./fstab.sh

set -eo nounset

cd /other-repos || cd /repos

cd mpc
git reset --hard
git clean -d -f -x
git pull origin master
autoreconf -fi

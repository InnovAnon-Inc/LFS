set -eo nounset

cd /other-repos || cd /repos

cd gmp
if which hg ; then
hg pull
hg up -C
hg --config extensions.purge= purge --all
fi
./.bootstrap

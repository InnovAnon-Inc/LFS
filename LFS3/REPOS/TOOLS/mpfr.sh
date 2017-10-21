set -eo nounset

cd /other-repos || cd /repos

cd mpfr
if which svn ; then
svn revert -R .
svn status --no-ignore | grep -E '(^\?)|(^\I)' | sed 's/^. *//' | \
sed 's/\(.*\)/"\1"/' | xargs rm -rf
svn up --force
fi
./autogen.sh

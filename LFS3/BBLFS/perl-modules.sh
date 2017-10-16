set -eo nounset

cat << "EOF" | sed 's/^/install /' | cpan
inc::latest
EOF

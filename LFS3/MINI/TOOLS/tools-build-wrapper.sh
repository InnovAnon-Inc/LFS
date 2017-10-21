set -eo nounset

test $# -ne 0

su - lfs << EOF
source \$HOME/.bashrc
build-wrapper.sh $*
EOF


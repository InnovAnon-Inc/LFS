set -eo nounset

test $# -ne 0

su - lfs << EOF
source \$HOME/.bashrc
cd /workspace/LFS/LFS3/REPOS/TOOLS
$*
EOF


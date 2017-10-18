set -eo nounset
set +h

test -e /etc/shells || \
cat > /etc/shells << "EOF"
# Begin /etc/shells

/bin/sh
/bin/bash

# End /etc/shells
EOF

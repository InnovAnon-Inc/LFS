set -eo nounset
set +h

#locale -a

#for LN in POSIX en_US.utf8 ; do
#LC_ALL=$LN locale language
#LC_ALL=$LN locale charmap
#LC_ALL=$LN locale int_curr_symbol
#LC_ALL=$LN locale int_prefix
done

test -e /etc/profile || \
cat > /etc/profile << "EOF"
# Begin /etc/profile

export LANG=en_US.utf8

# End /etc/profile
EOF

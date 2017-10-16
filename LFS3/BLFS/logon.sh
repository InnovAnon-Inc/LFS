set -eo nounset

if test -e /etc/issue ; then
	echo /etc/issue
else
cat > /etc/issue << "EOF"
baudrate: \b
current date: \d
system name: \s
current tty line: \l
architecture identifier: \m
nodename: \n
domainname: \o
kernel release number: \r
current time: \t
current \U logged in
version: \v
EOF
fi

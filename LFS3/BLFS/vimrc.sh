set -eo nounset

for k in ~/.vimrc /etc/vimrc ; do
	if test -e $k ; then
		echo $k
	else
cat > $k << EOF
" Begin `basename $k`

set columns=80
set wrapmargin=8
set ruler

" End .vimrc
EOF
	fi
done


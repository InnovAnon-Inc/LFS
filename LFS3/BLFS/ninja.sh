set -eo nounset

cd /sources

test -f ninja-1.8.2.tar.gz || \
wget --no-check-certificate \
	 https://github.com/ninja-build/ninja/archive/v1.8.2/ninja-1.8.2.tar.gz

rm -rf ninja-1.8.2
tar xf ninja-1.8.2.tar.gz
pushd  ninja-1.8.2

python3 configure.py --bootstrap

if `which emacs` ; then
emacs -Q --batch -f batch-byte-compile misc/ninja-mode.el
fi

python3 configure.py &&
./ninja ninja_test   &&
./ninja_test --gtest_filter=-SubprocessTest.SetWithLots

install -vm755 ninja /usr/bin/ &&
install -vDm644 misc/ninja.vim \
                /usr/share/vim/vim80/syntax/ninja.vim &&
install -vDm644 misc/bash-completion \
                /usr/share/bash-completion/completions/ninja &&
install -vDm644 misc/zsh-completion \
                /usr/share/zsh/site-functions/_ninja

if `which emacs` ; then
install -vDm644 misc/ninja-mode.el \
                /usr/share/emacs/site-lisp/ninja-mode.el
install -vDm644 misc/ninja-mode.elc \
                /usr/share/emacs/site-lisp/ninja-mode.elc
fi

ninja manual &&
install -vDm644 doc/manual.html /usr/share/doc/ninja-1.8.2/manual.html

ninja doxygen &&
install -vDm644 -t /usr/share/doc/ninja-1.8.2/ doc/doxygen/html/*

popd
rm -rf ninja-1.8.2

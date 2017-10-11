set -eo nounset

cd /sources

rm -rf ninja-1.8.2
tar xf ninja-1.8.2.tar.gz
pushd  ninja-1.8.2

python3 configure.py --bootstrap

python3 configure.py
#./ninja ninja_test
#./ninja_test --gtest_filter=-SubprocessTest.SetWithLots

install -vm755 ninja /usr/bin/
install -vDm644 misc/ninja.vim \
                /usr/share/vim/vim80/syntax/ninja.vim
install -vDm644 misc/bash-completion \
                /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion \
                /usr/share/zsh/site-functions/_ninja

popd
rm -rf ninja-1.8.2

set -eo nounset

cd /sources

test -f vim-8.0.586.tar.bz2 || \
wget --no-check-certificate \
	http://ftp.vim.org/vim/unix/vim-8.0.586.tar.bz2

rm -rf vim80
tar xf vim-8.0.586.tar.bz2
pushd  vim80

echo '#define SYS_VIMRC_FILE  "/etc/vimrc"' >>  src/feature.h &&
echo '#define SYS_GVIMRC_FILE "/etc/gvimrc"' >> src/feature.h &&

./configure --prefix=/usr \
            --with-features=huge \
            --with-tlib=ncursesw &&
make

make install

ln -snfv ../vim/vim80/doc /usr/share/doc/vim-8.0.586

rsync -avzcP --delete --exclude="/dos/" --exclude="/spell/" \
    ftp.nluug.nl::Vim/runtime/ ./runtime/

make -C src installruntime &&
vim -c ":helptags /usr/share/doc/vim-8.0.586" -c ":q"

cat > /usr/share/applications/gvim.desktop << "EOF"
[Desktop Entry]
Name=GVim Text Editor
Comment=Edit text files
Comment[pt_BR]=Edite arquivos de texto
TryExec=gvim
Exec=gvim -f %F
Terminal=false
Type=Application
Icon=gvim.png
Categories=Utility;TextEditor;
StartupNotify=true
MimeType=text/plain;
EOF

#:setlocal spell spelllang=ru

#:help version-8.0.586

popd
rm -rf vim80

set -eo nounset

cd /other-repos || cd /repos

if [ -d Pyrit ] ; then
	pushd Pyrit
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/JPaulMora/Pyrit.git
fi

cd Pyrit

#./autogen.sh
#./configure
#make
#make install

pip install psycopg2
pip install scapy

python setup.py clean
python setup.py build
python setup.py install --optimize=1

test -d ~/.pyrit || \
mkdir -vm0755 ~/.pyrit
test -e ~/.pyrit/config || \
cat > ~/.pyrit/config << "EOF"
use_CUDA = true
use_OpenCL = false
limit_ncpus = -1
EOF

cd modules/cpyrit-cuda
python setup.py build
python setup.py install --optimize=1

cd modules/cpyrit_opencl/
python setup.py build
python setup.py install --optimize=1

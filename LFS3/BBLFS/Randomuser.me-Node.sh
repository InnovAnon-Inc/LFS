set -eo nounset

cd /other-repos || cd /repos

if [ -d Randomuser.me-Node ] ; then
	pushd Randomuser.me-Node
	git reset --hard
	git clean -d -f -x
	git pull origin master
	popd
else
	git clone https://github.com/RandomAPI/Randomuser.me-Node.git
fi

cd Randomuser.me-Node

npm install
npm i -g gulp
gulp build
gulp
npm start

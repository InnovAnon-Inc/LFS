set -eo nounset

./libffi.sh
./python3.sh
./openssl.sh
./make-ca.sh
./wget.sh

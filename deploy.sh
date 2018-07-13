rm -rf cybersecurity-situation-awareness
rm -rf tmp
rm -rf artifacts
rm -rf web
mkdir tmp
mkdir artifacts
./deploy-web.sh
./deploy-fe.sh


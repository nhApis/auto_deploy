echo -e "\033[33m编译web_api \033[1m"
git clone git@10.10.10.8:Cybersecurity-Situation-Awareness/web.git
cd web
npm config set registry https://registry.npm.taobao.org
npm install
npm run build
cd ..
mv web/dist tmp/html
cd tmp
tar -czf html.tgz html
cd ..
scp tmp/html.tgz artifacts/
cd artifacts/
echo -e "\033[33m打包完成 \033[1m"
#scp -r html.tgz /idss/idss-bigData-platform/idss-standardPackage

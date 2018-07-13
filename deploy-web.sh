echo -e "\033[33m编译web_api \033[1m"
git clone git@10.10.10.8:Cybersecurity-Situation-Awareness/cybersecurity-situation-awareness.git
cd cybersecurity-situation-awareness
mvn clean
mvn install
cd ..
mv cybersecurity-situation-awareness/application/target/cybersecurity.tar.gz tmp
tar -xvf tmp/cybersecurity.tar.gz -C tmp/
tar -xvf tmp/cybersecurity.tar.gz -C artifacts/
mv tmp/cybersecurity.tar.gz tmp/cybersecurity.tar.gz_bak
echo -e "\033[33m解压成功web_api \033[1m"
echo -e "\033[33m开始混淆web_api \033[1m"
rm -rf cybersecurity-situation-awareness/Code-obfuscation/library-jars
mkdir -p cybersecurity-situation-awareness/Code-obfuscation/library-jars
scp tmp/cybersecurity/lib/*jar cybersecurity-situation-awareness/Code-obfuscation/library-jars
rm -rf cybersecurity-situation-awareness/Code-obfuscation/src_jar
mkdir -p cybersecurity-situation-awareness/Code-obfuscation/src_jar
mv cybersecurity-situation-awareness/Code-obfuscation/library-jars/application-1.0.0.jar cybersecurity-situation-awareness/Code-obfuscation/src_jar
mv cybersecurity-situation-awareness/Code-obfuscation/library-jars/cybersecurity-1.0.0.jar cybersecurity-situation-awareness/Code-obfuscation/src_jar
mv cybersecurity-situation-awareness/Code-obfuscation/library-jars/dashboard-1.0.0.jar cybersecurity-situation-awareness/Code-obfuscation/src_jar
mv cybersecurity-situation-awareness/Code-obfuscation/library-jars/pipeline-1.0.0.jar cybersecurity-situation-awareness/Code-obfuscation/src_jar
cd cybersecurity-situation-awareness  && sh Code-obfuscation/RunAllatori.sh
cd ../
echo -e "\033[33m混淆web_api完成 \033[1m"
scp cybersecurity-situation-awareness/Code-obfuscation/dst_jar/*jar artifacts/cybersecurity/lib/
cd artifacts/
echo -e "\033[33m开始打包 \033[1m"
tar -czf cybersecurity.tar.gz cybersecurity
scp -r cybersecurity.tar.gz /idss/idss-bigData-platform/idss-standardPackage

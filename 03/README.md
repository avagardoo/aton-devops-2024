# Использовал стандартный Postfix 
```bash
apt-get install libsasl2-modules postfix

# делаем скрипты исполняемыми
chmod a+x trash.sh
chmod a+x mailer_manual.sh 
chmod a+x mailer_auto.sh

./trash.sh
./mailer_manual.sh
./mailer_auto.sh
```

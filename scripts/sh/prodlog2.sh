 #!/bin/bash          

echo 'usage: <cmd> <date>   ex: getprodlogs.sh 2014-09-07'
echo "You passed $1. starting.."
sshpass -p 'catfox' scp paadmin@palogs.infor.com://home/paadmin/logGrab/logs-app11-$1.zip .
echo "copied app11..."
sshpass -p 'catfox' scp paadmin@palogs.infor.com://home/paadmin/logGrab/logs-app12-$1.zip .
echo "copied app12..."
unzip logs-app11-$1.zip
mv server.log.$1 server.log.$1.app11
echo "unzipped 11"
unzip logs-app12-$1.zip
mv server.log.$1 server.log.$1.app12
echo "unzipped 12"
rm logs-app11-$1.zip
rm logs-app12-$1.zip

echo 'complete'

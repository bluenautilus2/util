 #!/bin/bash          

echo 'usage: <cmd> <date>   ex: getprodlogs.sh 2014-09-07'
echo "You passed $1. starting.."
sshpass -p 'catfox' scp paadmin@palogs.infor.com://home/paadmin/logGrab/logs-app13-$1.zip .
echo "copied app13..."
sshpass -p 'catfox' scp paadmin@palogs.infor.com://home/paadmin/logGrab/logs-app14-$1.zip .
echo "copied app14..."
sshpass -p 'catfox' scp paadmin@palogs.infor.com://home/paadmin/logGrab/logs-app15-$1.zip .
echo "copied app15..."

unzip logs-app13-$1.zip
mv custom_all.log.$1 custom_all.log.$1.app13
mv custom_error.log.$1 custom_error.log.$1.app13
mv custom_fatal.log.$1 custom_fatal.log.$1.app13
mv sql.log.$1 sql.log.$1.app13
mv access.log-* access.log.$1.app13
rm integration_all.log.$1 
rm integration_error.log.$1 
rm integration_fatal.log.$1 
echo "unzipped 13"

unzip logs-app14-$1.zip
mv custom_all.log.$1 custom_all.log.$1.app14
mv custom_error.log.$1 custom_error.log.$1.app14
mv custom_fatal.log.$1 custom_fatal.log.$1.app14
mv sql.log.$1 sql.log.$1.app14
mv access.log-* access.log.$1.app14
rm integration_all.log.$1 
rm integration_error.log.$1 
rm integration_fatal.log.$1 
echo "unzipped 14"

unzip logs-app15-$1.zip
mv custom_all.log.$1 custom_all.log.$1.app15
mv custom_error.log.$1 custom_error.log.$1.app15
mv custom_fatal.log.$1 custom_fatal.log.$1.app15
mv sql.log.$1 sql.log.$1.app15
mv access.log-* access.log.$1.app15
rm integration_all.log.$1 
rm integration_error.log.$1 
rm integration_fatal.log.$1 
echo "unzipped 15"

rm logs-app13-$1.zip
rm logs-app14-$1.zip
rm logs-app15-$1.zip

echo 'complete'

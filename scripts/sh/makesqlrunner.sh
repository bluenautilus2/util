 #!/bin/bash          
chmod 777 ~/sqlrunner/sqlRunner.jar
rm ~/sqlrunner/sqlRunner.jar

cp /opt/develWorkspace/Source/PAUtilities/javaApps/sqlRunner/out/artifacts/sqlRunner_jar/sqlRunner.jar ~/sqlrunner/

rm ~/windowsFiles/sqlRunnerGoldCopy/sqlRunner.zip
cp ~/windowsFiles/testing/sqlrunner/sqlrunner/cassconfig.json ~/windowsFiles
cp ~/windowsFiles/testing/sqlrunner/sqlrunner/datastores.json ~/windowsFiles
cp ~/windowsFiles/testing/sqlrunner/sqlrunner/sqlconfig.json ~/windowsFiles
rm -fr ~/windowsFiles/testing/*

7z a -tzip ~/windowsFiles/sqlRunnerGoldCopy/sqlRunner.zip ~/sqlrunner/*
cp ~/windowsFiles/sqlRunnerGoldCopy/sqlRunner.zip ~/windowsFiles/testing/



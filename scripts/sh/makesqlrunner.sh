 #!/bin/bash          

cd ~/
cp /home/bstevens/repos/PAUtilities/javaApps/sqlRunner/out/artifacts/sqlRunner_jar/sqlRunner.jar ~/sqlRunner/
7z a -tzip sqlRunner.zip ~/sqlRunner
cp sqlRunner.zip ~/windowsFiles/sqlRunnerGoldCopy/


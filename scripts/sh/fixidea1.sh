 #!/bin/bash          
git update-index --assume-unchanged ~/repos/App/.idea/modules.xml
cp ~/repos/ant.xml ~/repos/App/.idea/
git update-index --assume-unchanged ~/repos/App/.idea/ant.xml
git checkout .idea/codeStyleSettings.xml
git checkout .idea/inspectionProfiles/PA_Inspections.xml
git checkout Tomcat_Marketing/Tomcat_Marketing.iml
git checkout Tomcat_PA/Tomcat_PA.iml
git checkout Tomcat_WS-Secure/Tomcat_WS-Secure.iml
git checkout Tomcat_PA/WebRoot/js/PA_4.js
rm -rf Tomcat_Marketing/WebRoot/HTML


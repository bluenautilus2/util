 #!/bin/bash          

if [ -e "/tmp/bef/pa.war" ]; then
    echo "found war"; 
    rm /home/tomcat/deployments/pa.war;
    mv /tmp/bef/pa.war /home/tomcat/deployments/;
    chown tomcat:tomcat /home/tomcat/deployments/pa.war;
    echo "copied war";
    su tomcat;
    echo "am tomcat";
    /home/tomcat/bin/deploy pa /home/tomcat/deployments/pa.war;
    echo "ran deploy";
    exit;
    echo "exiting";
fi

 

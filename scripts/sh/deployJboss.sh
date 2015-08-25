 #!/bin/bash          

if [ -e "/tmp/bef/pa-ear-master.ear" ]; then
    echo "found ear"; 
    rm /home/jboss/deployments/pa-ear-master.ear;
    mv /tmp/bef/pa-ear-master.ear /home/jboss/deployments/;
    chown jboss:jboss /home/jboss/deployments/pa-ear-master.ear;
    su jboss;
    /home/jboss/bin/deploy /home/jboss/deployments/pa-ear-master.ear;
    exit;
fi


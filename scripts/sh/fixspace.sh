 #!/bin/bash          
sed -i -sre 's|[ \t]+$||;' $1
sed -i -sre 's|[ \t]+\n||;' $1

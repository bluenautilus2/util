 #!/bin/bash          

echo 'usage: <cmd> <file>   ex: copyfile.sh 1983432.sql'
echo "You passed $1. starting.."

cat $1 | xclip -i -selection clipboard


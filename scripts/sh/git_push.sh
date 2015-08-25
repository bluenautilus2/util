 #!/bin/bash          
 
me=`basename $0`

if [ -z $1 ]
   then 
     echo 
     echo "usage: $me {Jira Number} {branch}     (branch is optional and defaults to master)"    
     echo
     echo "example: $me PA-34234"
     echo "example: $me PA-29835 testBranch"
     echo
     exit
fi

jira=$1

if [ -z $2 ]
   then
     branch="master"
   else
     branch=$2
fi

echo "Pushing to remote branch $branch for Jira $jira"
cmd="git push origin HEAD:refs/for/$branch/$jira"
echo $cmd
eval $cmd

#!/usr/bin/env bash

xid="x243606"
samlcli_dir="/Users/bethstevens/dev/swa/samlcli"

dev-dev() {
  runlogin 988101568216 SWACSDeveloper $xid 
}

qa-dev() {
  runlogin 042808334126 SWACSDeveloper $xid 
}

prod-read-only() {
  runlogin 707239158216 SWACSReadOnly $xid 
}

runlogin () {
    : ${1:?"Please pass account number for AWS account"}
    : ${2:?"Please pass role you are using."}
    : ${3:?"Please pass XID"}
    clearaws
    curdir=`pwd`
    cd $samlcli_dir 
    rm ./awscreds; touch ./awscreds
    echo "Running \"source assume-role.sh $1 $2 $3\""
    source assume-role.sh $1 $2 $3
    : ${AWS_SESSION_TOKEN:?"Amazon credentials weren't set"} 
    kubefile="$HOME/.kube/$1"."$2".config
    kubegen.py "$kubefile" 
    export KUBECONFIG="$kubefile"
    cd $curdir
    echo; echo "COPY FOR NEW TERMINALS"
    echo "---------------------------------------"
    echo "export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"
    echo "export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"
    echo "export AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN"
    echo "export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION"
    echo "export KUBECONFIG=$kubefile"

}

clearaws() {
	unset AWS_PROFILE
	unset AWS_DEFAULT_PROFILE
	unset AWS_ACCESS_KEY_ID
	unset AWS_SECRET_ACCESS_KEY
	unset AWS_SESSION_TOKEN
        unset AWS_DEFAULT_REGION
	echo "AWS Env variables cleared "
}



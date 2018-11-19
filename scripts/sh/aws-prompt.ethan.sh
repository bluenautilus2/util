#!/usr/bin/env bash

setaws () {
	export AWS_DEFAULT_PROFILE=$1
	export AWS_PROFILE=$1
	echo "aws profile set to $1"
}
clearaws() {
	unset AWS_PROFILE
	unset AWS_DEFAULT_PROFILE
	unset AWS_ACCESS_KEY_ID
	unset AWS_SECRET_ACCESS_KEY
	unset AWS_SESSION_TOKEN
	echo "aws profile cleared"
}
getawsmfa() {
    if [ "$1" = "clear" ]; then
        unset AWS_ACCESS_KEY_ID
        unset AWS_SECRET_ACCESS_KEY
        unset AWS_SESSION_TOKEN

        echo "mfa-helper:  env variables cleared."
    else

       MFA_SERIAL=$(aws configure get mfa_serial)
       STSRESPONSE=$(aws sts get-session-token --serial-number $MFA_SERIAL --token-code $1 --duration-seconds 21600)
       
       ACCESS_KEY_ID=$(echo $STSRESPONSE | jq -r ."Credentials"."AccessKeyId")
        SECRET_ACCCESS_KEY=$(echo $STSRESPONSE | jq -r ."Credentials"."SecretAccessKey")
        SESSION_TOKEN=$(echo $STSRESPONSE | jq -r ."Credentials"."SessionToken")


        export AWS_ACCESS_KEY_ID=$ACCESS_KEY_ID
        export AWS_SECRET_ACCESS_KEY=$SECRET_ACCCESS_KEY
        export AWS_SESSION_TOKEN=$SESSION_TOKEN

        echo "mfa-helper:  sts token obtained and set"
    fi
}

__aws_prompt () {    
  if [ -z ${AWS_DEFAULT_PROFILE+x} ] ; then        
    AWS_PROFILE_SHOW=""    
  else        
    AWS_PROFILE_SHOW=" \e[0;33m($AWS_DEFAULT_PROFILE)\e[m"    
  fi    

  echo -eE "$AWS_PROFILE_SHOW"
}

_setaws_completion() {
  local cur

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}

  profiles=$(cat ~/.aws/config | grep profile | cut -d ' ' -f2- | tr ']' ' ')

  case "$cur" in
    
    *)
      COMPREPLY=( $( compgen -W "${profiles}" -- $cur ))
      ;;
  esac

  return 0
}

complete -F _setaws_completion -o filenames setaws

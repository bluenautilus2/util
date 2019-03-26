
export PATH=$PATH:/usr/local/Cellar/python/3.7.1/Frameworks/Python.framework/Versions/3.7/bin
export PATH=$PATH:./:~/dev/scripts/scripts/pl:~/dev/scripts/scripts/py:~/dev/scripts/scripts/sh

export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\[\e[0;35m\]bethstevens:\[\e[37;1m\]\w\[\e[0;34m\]:\[\e[0;35m\]>\[\e[1;34m\]>\[\e[m\]"

source ~/.git-completion.bash

alias ls='ls -GFh'
alias d='cd ..; '
alias godev='cd ~/dev/fedex/'
export GRADLE_HOME=/usr/local/Cellar/gradle/4.10.2
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home
alias gos='cd ~/dev/scripts/scripts/'
alias gonotes='cd ~/dev/scripts/notes/'
alias killport='netstat -vanp tcp | grep ' 
alias tunnel='ssh -D 1080 ec2-user@34.207.131.40 -i ~/.secrets/spotify-client-firsttry.pem -fN'
alias istunnel='ps -ef | grep spotify-client-firsttry | grep -v grep'
export https_proxy=http://internet.proxy.fedex.com:3128
alias pcf='cf login -a https://api.sys.wtcdev2.paas.fedex.com'
alias swagger='echo dockerfile'
alias adoc='asciidoctor -D build/ *.adoc'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

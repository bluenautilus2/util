#!/bin/sh

cd ~/dev/swa/samlcli
source assume-role.sh 988101568216 SWACSDeveloper x2436060
kubesync.py
export KUBECONFIG=~/.kube/config.current



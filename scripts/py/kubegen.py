#!/usr/bin/python
import os 
import subprocess
import json 
import yaml
import sys

AWS_token = os.environ.get('AWS_ACCESS_KEY_ID')
if not AWS_token:
  print "AWS_ACCESS_KEY_ID not set, are you logged into the AWS CLI?"
  sys.exit()

configfile = sys.argv[1]
if not configfile:
  configfile = "~/.kube/config.current"

roleJSON = subprocess.Popen('aws sts get-caller-identity', shell=True, stdout=subprocess.PIPE).stdout.read()

roleDict = json.loads(roleJSON.strip())
stsarn = roleDict['Arn']
role = (stsarn[stsarn.rfind(":"):].split("/"))[1] 
account = roleDict['Account']
clusterJSON = subprocess.Popen('aws eks list-clusters', shell=True, stdout=subprocess.PIPE).stdout.read()
jsonclusters = json.loads(clusterJSON.strip())
myconfig = {}
myconfig['apiVersion'] = "v1"
myconfig['clusters'] = []
myconfig['current-context'] = jsonclusters['clusters'][0]
myconfig['contexts'] = []
myconfig['kind'] = "Config"
myconfig['users'] = []

for cluster_name in jsonclusters['clusters']:
  describeJSON = subprocess.Popen('aws eks describe-cluster --name '+cluster_name, shell=True, stdout=subprocess.PIPE).stdout.read() 
  describe = json.loads(describeJSON.strip())
  clust = {}
  clust['cluster'] = {}
  clust['cluster']['certificate-authority-data'] = describe['cluster']['certificateAuthority']['data']
  clust['cluster']['server'] = describe['cluster']['endpoint']
  clust['name'] = cluster_name
  context = {}
  context['context'] = {}
  context['context']['cluster']=cluster_name
  context['context']['namespace']="opssuite"
  context['context']['user'] = cluster_name 
  context['name']= cluster_name
  user = {}
  user['name'] = cluster_name
  user['user'] = {}
  user['user']['exec'] = {}
  user['user']['exec']['apiVersion'] = "client.authentication.k8s.io/v1alpha1"
  user['user']['exec']['args'] = ["token","-i",cluster_name,"-r","arn:aws:iam::"+account+":role/swa/"+role] 
  user['user']['exec']['command'] = "heptio-authenticator-aws" 
  myconfig['clusters'].append(clust)
  myconfig['contexts'].append(context)
  myconfig['users'].append(user)
  myconfig['env'] = "null"

config_text = yaml.safe_dump(myconfig, default_flow_style=False, encoding=None)
#print config_text
newConfig = open(configfile,"w+")
newConfig.write(config_text)
newConfig.close()
print "Settings successfully saved for Kubernetes. Current context: "+myconfig['current-context']+"\n"


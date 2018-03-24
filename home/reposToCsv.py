#/usr/bin/env python
import requests
from requests.auth import HTTPBasicAuth

r = requests.get('https://api.bitbucket.org/2.0/repositories/eddiewebb?pagelen=100',auth=HTTPBasicAuth('eddiewebb','appapassword'))
repos = r.json()
for repo in repos['values']:
    if not 'parent' in repo:
    #print '"' + repo['name'] + '",' + '"'+ repo['description'].replace('\n', ' ').replace('"','\'') + '",' + '"'+ repo['links']['html']['href'] + '"'
        print  repo['full_name'] + ',' +  repo['description'].replace('\n', ' ').replace(',',';') + ',' +  repo['links']['html']['href']

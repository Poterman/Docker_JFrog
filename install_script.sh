#!/bin/bash

# MAIN
echo "deb https://jfrog.bintray.com/artifactory-pro-debs xenial main" >> /etc/apt/sources.list
curl https://bintray.com/user/downloadSubjectPublicKey?username=jfrog | apt-key add -
apt-get update -y
apt-get install jfrog-artifactory-pro -y

#!/usr/bin/env bash

# update DB
sudo yum -y update
sudo yum install -y epel-release
sudo yum -y update
# Install curl and vim
which curl vim wget curl &>/dev/null || {
  sudo yum install -y curl vim wget curl
}

# Install jenkins
sudo yum install -y java-1.8.0-openjdk.x86_64

sudo cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profile
source /etc/profile
echo $JAVA_HOME
echo $JRE_HOME

cd ~ 
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install -y jenkins

sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service

echo "Hi, I'm sleeping for 20 seconds..."
sleep 20 
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo 'Please copy the above password and use it to unlock Jenkins on port 8080'
IP=$(curl https://ipinfo.io/ip)
echo http://$IP:8080
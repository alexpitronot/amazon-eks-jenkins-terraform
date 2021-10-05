#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
sudo yum remove -y java
sudo yum install -y java-1.8.0-openjdk-devel

echo "Install Maven"
sudo yum install -y maven 

echo "Install git"
sudo yum install -y git

echo "Install Docker engine"
sudo yum update -y
sudo yum install docker -y
#sudo usermod -a -G docker jenkins
#sudo service docker start
sudo chkconfig docker on

echo "Install Jenkins"
sudo amazon-linux-extras install epel -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo yum install -y jenkins
sudo systemctl start jenkins
sudo usermod -a -G docker jenkins
sudo chmod 666 /var/run/docker.sock
sudo chkconfig jenkins on
sudo systemctl daemon-reload
sudo service docker start
sudo service jenkins start

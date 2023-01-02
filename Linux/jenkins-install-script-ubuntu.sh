#! /bin/bash
# Update the repo
sudo apt update -y

# Install Java SDK 11
sudo apt install -y wget git vim nano curl openjdk-11-jdk

# Download and Install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt -y update
sudo apt -y install jenkins

# Start Jenkins
sudo systemctl start jenkins

# Enable Jenkins to run on Boot
sudo systemctl enable jenkins

# Copying the secret Key to the file
sudo sh -c 'sudo cat /var/lib/jenkins/secrets/initialAdminPassword > /tmp/secret.txt'

#ADDING JENKINS TO SUDO GROUP
sudo usermod -aG sudo jenkins

# ####ADDING JENKINS USER TO SUDOERS FILE##
# sudo sed -i '26 a jenkins  ALL=(ALL) NOPASSWD:ALL' /etc/sudoers
# ####ADDING JENKINS USER TO SUDOERS FILE##
# sudo sed -i '26 a jenkins  ALL=(ALL) NOPASSWD:ALL' /etc/sudoers
# ####CHANGING PORT OF JENKINS SERVER####
# sed -i '63d' /etc/default/jenkins && sed -i '63 a HTTP_PORT=8090' /etc/default/jenkins
# ####RESTART JENKINS AND SHOW THE STATUS OF JENKINS####
# systemctl restart jenkins && systemctl status jenkins
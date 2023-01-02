#!/bin/bash

#docker_installation

if [ ! -x /var/lib/docker ]; then
      
        echo "INSTALLING docker"
echo
echo 
    #install docker dependencies 

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common 

echo
    #add docker’s official GPG key
curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add - 
echo
echo
    #set up the stable repository.
sudo add-apt-repository \
    "deb https://apt.dockerproject.org/repo/ \
    ubuntu-$(lsb_release -cs) \
    main" 
echo
    #update the packages    
sudo apt-get update -y
sudo apt-get -y install docker-engine 


echo
echo
	#installing docker-compose
sudo apt install docker-compose -y
echo
echo
    # Create the docker group.
sudo groupadd docker

    #adds your username to the docker group
    # sudo usermod -aG docker ${USER}
    #add current user to docker group so there is no need to use sudo when running docker
sudo usermod -aG docker ${USER}
    # Add permission to the Docker daemon socket
sudo chmod 666 /var/run/docker.sock

       echo "docker successfully installed"

echo
echo

else

echo
echo
        echo "DOCKER ALREADY INSTALLED"
echo
echo

fi
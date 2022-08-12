#!/usr/bin/env bash

####Create a common network
docker network create jenkins

#run jenkins in a docker container
docker run \
  --name jenkins-docker \
  --rm \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  --publish 3000:3000 \
  docker:dind \
  --storage-driver overlay2 

#Run the dockerfile
docker build -t myjenkins-blueocean:2.346.2-1 \
  --build-arg ssh_prv_key="$(cat /home/azureuser/.ssh/id_rsa)" \
  --build-arg ssh_pub_key="$(cat /home/azureuser/.ssh/id_rsa.pub)" .

docker run \
  --name jenkins-blueocean \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  --volume "$HOME":/home \
  --restart=on-failure \
  --env JAVA_OPTS="-Dhudson.plugins.git.GitSCM.ALLOW_LOCAL_CHECKOUT=true" \
  myjenkins-blueocean:2.346.2-1 \
  --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" \
  --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)"


#Print the command password
sudo docker exec -it jenkins-blueocean /bin/bash -c \ "cat /var/jenkins_home/secrets/initialAdminPassword"

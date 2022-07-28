#!/usr/bin/env bash


#Create directory in /bin
sudo cd -p /bin/spring-petclinic

#Copy from docker volume of the jenkins container to the local
sudo docker cp jenkins-blueocean:/var/jenkins_home/workspace/spring-petclinic/target/spring-petclinic-2.7.0-SNAPSHOT.jar .

#Run the jar file
java -jar ./spring-petclinic-2.7.0-SNAPSHOT.jar 

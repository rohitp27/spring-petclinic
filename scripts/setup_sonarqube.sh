#!/usr/bin/env bash

#setup sonarqube 
sudo docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube

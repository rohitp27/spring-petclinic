#!/usr/bin/env bash

cd $PROJECT_HOME

sudo bash ./setup_sonarqube.sh

echo "--------------------------------"
echo "--------------------------------"
echo "--------------------------------"

sudo bash ./setup_jenkins_with_blueocean.sh

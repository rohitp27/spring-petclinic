FROM jenkins/jenkins:2.346.2-jdk11

USER root

RUN apt-get update && apt-get install -y lsb-release

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg

RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y docker-ce-cli

RUN apt-get update && \
  apt-get install -y gcc python-dev && \
  apt-get install python3-pip -y && \
  pip3 install --upgrade pip && \
  pip3 install --upgrade virtualenv && \ 
  pip3 install pywinrm && \

RUN apt-get update && apt-get install -y ansible

USER jenkins

RUN jenkins-plugin-cli --plugins "blueocean:1.25.5 docker-workflow:1.28 ansible:1.1"

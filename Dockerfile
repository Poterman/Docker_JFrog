# Telling Docker which image to pull
FROM ubuntu:16.04
# Setting user root
USER root
# Setting Bash as sheel
SHELL ["/bin/bash", "-c"]
# Installing net tools
RUN apt-get update && apt-get install dialog apt-utils net-tools iputils-ping -y
# Installing java curl vim & nginx
RUN  apt-get install openjdk-8-jdk curl vim nginx -y
# Setting up the JAVA_HOME variable
RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java" >> /etc/environment
# Exposing relevent ports
EXPOSE 443 80 8081
# Adding support for https apt sources
RUN apt-get install apt-transport-https ca-certificates -y
# Copy install script
COPY ./install_script.sh /tmp/
# Running install script
RUN /tmp/install_script.sh
# Setting entrypoint to run artifactory.sh
ENTRYPOINT ["/opt/jfrog/artifactory/bin/artifactory.sh"]

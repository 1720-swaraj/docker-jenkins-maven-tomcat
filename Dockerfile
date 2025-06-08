FROM tomcat:9-jdk11
LABEL maintainer="swarajkadam"
WORKDIR /mnt/website
RUN rm -rf *
COPY target/*.war /usr/local/tomcat/webapps/  

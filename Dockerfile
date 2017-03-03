FROM ubuntu

# Install wget, Java and git	
RUN apt-get -y update && apt-get install -y wget && apt-get -y install default-jre && apt-get -y install git 

# Install and configure Tomcat9
RUN cd /opt && wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.0.M17/bin/apache-tomcat-9.0.0.M17.tar.gz && \
    tar xzf apache-tomcat-9.0.0.M17.tar.gz && mv apache-tomcat-9.0.0.M17 tomcat9 && rm apache-tomcat-9.0.0.M17.tar.gz 
    





### 1. docker build

* Da bi kreirali docker image, potrebno je pokrenuti `docker build` sa parametrima koji su nam bitni. Sada cu kreirati image koji se zove java_tomcat (switch -t) iz Dockerfile-a koji se nalazi u folderu u kome smo (obrati paznju na `.` na kraju). Osnova za image ce biti defaultni `ubuntu` image ali to pise u Dockerfile-u
`docker build -t java_tomcat .` 
```
FROM ubuntu

# Install Java, utils
RUN apt-get -y update && apt-get install -y \
    wget \
    default-jdk \
    net-tools \
    iputils-ping \
    vim \
    curl \
    dpkg && 
# download and unpack tomcat 
CMD cd /opt \
    wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.0.M17/bin/apache-tomcat-9.0.0.M17.tar.gz 
``` 
### 2. docker cp
```
docker cp [OPTIONS] CONTAINER:/src/path /dest/path|-
docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
```

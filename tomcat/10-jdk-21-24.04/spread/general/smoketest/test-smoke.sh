#!/bin/sh -ex

mvn archetype:generate -DgroupId=com.example \
    -DartifactId=hello-world-war \
    -DarchetypeArtifactId=maven-archetype-webapp \
    -DarchetypeVersion=1.4  -DinteractiveMode=false
cd hello-world-war && mvn package
docker rm -f tomcat
docker run --name tomcat -d \
    -v `pwd`/target:/var/lib/tomcat/webapps -p 8080:8080 tomcat:${TOMCAT} -v
retry --times=10 --delay 2 -- curl http://localhost:8080/hello-world-war/ | grep -q "Hello World!"
docker logs tomcat | grep -q "Loaded Apache Tomcat Native library"
docker rm -f tomcat

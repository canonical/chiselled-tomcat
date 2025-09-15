#!/bin/sh -ex

git clone --depth 1 --branch v6.2.1 https://github.com/spring-petclinic/spring-framework-petclinic
cd spring-framework-petclinic
mvn -DskipTests package
cd target

docker rm -f tomcat
docker run --name tomcat -d \
    -v `pwd`:/var/lib/tomcat/webapps -p 8080:8080 tomcat:${TOMCAT} -v
retry --times=10 --delay 2 -- curl http://localhost:8080/petclinic/vets.json | grep -q "Douglas"
docker rm -f tomcat

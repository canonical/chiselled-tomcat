FROM ubuntu as builder

RUN apt-get update && \
    apt-get install -y maven git default-jdk git && \
    cd / && \
    git clone --depth 1 --branch v6.2.1 https://github.com/spring-petclinic/spring-framework-petclinic && \
    cd spring-framework-petclinic && \
    mvn -DskipTests package

FROM ubuntu/tomcat:10-jre-21-24.04
COPY --from=builder --chown=584792:584792 /spring-framework-petclinic/target/petclinic.war \
    /var/lib/tomcat/webapps/

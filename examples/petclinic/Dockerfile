FROM ubuntu/tomcat:9-jre-21-24.04
USER 584792
ADD --chown=584792:584792 petclinic.war /var/lib/tomcat/webapps/
RUN cp -r /usr/share/tomcat/webapps/manager /var/lib/tomcat/webapps
RUN cp -r /usr/share/tomcat/webapps/host-manager /var/lib/tomcat/webapps/
COPY --chown=584792:584792 tomcat-users.xml /var/lib/tomcat/conf

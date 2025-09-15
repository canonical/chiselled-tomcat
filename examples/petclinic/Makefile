#!/usr/bin/make -f

.PHONY: petclinic run
run: petclinic
	docker run -p 8080:8080 petclinic -v

petclinic: petclinic.war ubuntu/tomcat
	docker build -t petclinic .

petclinic.war:
	cp ../../test-data/petclinic.war .

ubuntu/tomcat:
	(cd ../../tomcat/10-jre-21-24.04 && rockcraft pack && \
		rockcraft.skopeo copy oci-archive:tomcat_10-jre-21-24.04_amd64.rock \
			"docker-daemon:ubuntu/tomcat:10-jre-21-24.04")

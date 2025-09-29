# Chiselled Tomcat

This repository contains chiselled ROCK definitions for Tomcat 9, 10 and 11.

# Usage

The rocks start Tomcat on startup. They use CATALINA_BASE
set to `/var/lib/tomcat`.

See [examples/petclinic](examples/petclinic/) for a sample Dockerfile.

To run the example,

```
cd examples/petclinic && make run
```

Navigate to [http://localhost:8080/petclinic](http://localhost:8080/petclinic)
to view the Petclinic application.

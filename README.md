# jenkins-pipeline-tutorial
Jenkins Pipeline Tutorial sample project

# Requirements

* Java JDK 11
* Maven >= 3.6

# Building and Testing
* Compile:
```shell
mvn compile
```

* Run unit tests:
```shell
mvn test
```

* Create jar:
```shell
mvn package
```

# Deploying

There are two totally real deploy scripts:
* `deploy.sh`: this script performs a simple deploy, just provide it with the artifact name and the version, like so:
   ```shell
   ./deploy.sh jenkins-pipeline-tutorial 1.0.0-SNAPSHOT
   ```
* `super-deploy.sh`: this script is a much better deploy (because it has SUPER in the name) and it requires some
   credentials, which you must provide using the `SUPER_CREDENTIALS` environment variable (hint: look at the script's
   code). Usage is the same as `deploy.sh`.

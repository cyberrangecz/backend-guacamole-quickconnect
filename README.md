> This repository has been archived. Ongoing development for Guacamole is now maintained in the [backend-guacamole](https://github.com/cyberrangecz/backend-guacamole) repository.

# CyberRangeCZ Platform Guacamole Quickconnect Extension

*crczp-guacamole-quickconnect* is a modification of the originally developed [guacamole-auth-quickconnect](https://github.com/apache/guacamole-client/tree/master/extensions/guacamole-auth-quickconnect) extension for guacamole client. It provides a connection bar on the Guacamole Client home page that allows users to type in the URI of a server to which they want to connect and the client will parse the URI and immediately establish the connection. The modified extension allows to specify guacamole proxy parameters (**guacd-hostname** and **guacd-port**) unlike original extension. 

## Build and usage

1) Run the following command to build a .jar.

```
mvn package
```

The .jar file will be created in the `/target` directory. 

2) Mount the built .jar file to [guacamole docker container](https://hub.docker.com/layers/guacamole/guacamole/1.6.0/images/sha256-50484043eadd8d9562053940c0ed523dbddaf9086c370127b2f4acabb8bddddc) as follows 

```
volumes:
      - {path to crczp-guacamole-quickconnect-1.6.0.jar}:/opt/guacamole/postgresql/guacamole-auth-quickconnect-1.6s.0.jar
```

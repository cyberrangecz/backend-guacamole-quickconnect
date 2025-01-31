# CyberRangeCZ Platform Guacamole Quickconnect Extension

*crczp-guacamole-quickconnect* is a modification of the originally developed [guacamole-auth-quickconnect](https://github.com/apache/guacamole-client/tree/master/extensions/guacamole-auth-quickconnect) extension for guacamole client. It provides a connection bar on the Guacamole Client home page that allows users to type in the URI of a server to which they want to connect and the client will parse the URI and immediately establish the connection. The modified extension allows to specify guacamole proxy parameters (**guacd-hostname** and **guacd-port**) unlike original extension. 

## Build and usage

1) Run the following command to build a .jar.

```
mvn package
```

The .jar file will be created in the `/target` directory. 

2) Mount the built .jar file to [guacamole docker container](https://hub.docker.com/layers/guacamole/guacamole/guacamole/1.3.0/images/sha256-739cb6820ae884827ceaaa87b45b8802769649c848d737584aea79d999177dc3?context=explore) as follows 

```
volumes:
      - {path to crczp-guacamole-quickconnect-1.3.0.jar}:/opt/guacamole/postgresql/guacamole-auth-quickconnect-1.3.0.jar
```

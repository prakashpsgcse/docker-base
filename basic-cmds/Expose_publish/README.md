#EXPOSE
-> Container Listens on this port 
-> default TCP [UDP mention]
```shell
EXPOSE {port} / {port}/{proto}
--expose={port} at run time
-------------------------------
EXPOSE 8080
EXPOSE 90/tcp
EXPOSE 9092/udp
```
-> This will not publish the port 
-> just INFO to user who runs this container that you have to publish this ports
#Publish
-> only published port is accessible on host machine 
-> without -p its accessible only with current docker n/w[bridge]
```shell
-p {host_port}:{container_port}
-P [publish all in random port]

-----------------------------
docker run -d -it -p 8080:8080 tomcat
docker run -d -it -p 8081:8080 tomcat

docker ps 
docker port {container}
0.0.0.0:32768->8080/tcp   [host:container]
0.0.0.0:8080->8080/tcp 

```

-> you cannot map hostport more than once
```shell
Bind for 0.0.0.0:8080 failed: port is already allocated.
```
-> you can expose and publish at runtime 
```shell
docker run -d -it --expose=3888 -p 9090:3888 tomcat
```
#Summary
-> no -E/-P no access only insdie container 
-> -E only within n/w [used for DB/Redis etc ]
-> -P outside
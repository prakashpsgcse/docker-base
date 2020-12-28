#CMD
->  default command
-> executedused ONLY when "docker run" executed without any cmd
-> This is executed when container starts 
-> docker container runs as long as cmd runs 
-> Only one CMD per docker file or used latest one
-> Ex: cmd ["echo" ,"fromcmd" ] after printing container dies
-> can be overwritten by ru"docker run"?????
### CMD syntax/forms
-> 3 forms 
#### Shell form 
"How we execute shell commands"
-> command is invoked inside a shell
```shell
CMD command param1 param2
-----------------------------------
CMD echo "i am echo using shell form"
CMD echo date
```

#### exec form [prefered form]
-> command is not invoked inside a shell
-> running without shell .Let's say we start running java program after logging into terminal/shell 
-> does not invoke a command shell
```shell
terminal/shell#java notification.jar 
terminal/shell#node app.js 
```
this invokes command shell

```shell
OP of docker exec 6f04327dbe52 ps x
PDID USER  CMD
1    root /bin/sh -c java notification.jar
1    root /bin/sh -c node app.js
```

-> exec form 
```shell
CMD ["executable","param1","param2"]
----------------------------------------------
CMD ["java" ,"notification.jar"]
CMD ["node","app.js"]
CMD ["/bin/sh","-c","date"]
```
```shell
OP of docker exec 6f04327dbe52 ps x
PDID USER  CMD
1    root  java notification.jar
1    root  node app.js
```
-> to run shell command use 
```shell
CMD ["/bin/sh","-c","command to run"]
CMD ["/bin/sh","-c","ls"]
CMD ["/bin/sh","-c","echo 'hello'"]
```
#### default param to ENTRYPOINT 
```shell
CMD ["param1","param2"] (as default parameters to ENTRYPOINT)
```
-> If there is arg to "docker run" then only cmd will be executed 
-> Example 
```shell
CMD ["/bin/sh","-c","echo 'hello'"]
------------------------------------------
docker run cmdtest ls
-----------OP--------------------
ls will be executed instead of echo
```

#ENTRYPOINT

https://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile
-> Docker has a default entrypoint which is /bin/sh -c
```shell
cmd []
```

#ENTRYPOINT
-> this is executed when container starts 
-> we can override ENTRYPOINT with "-entrypoint"
-> Container shuts down after entry point is done executing 
-> Container runs as executable ???[cmd is not????]
->

### ENTRYPOINT syntax/forms
-> 2 forms
#### Shell form
```shell
ENTRYPOINT command param1 param2
-----------------------------------
ENTRYPOINT echo "from eeeENTRYPOINT"
```
#### exec form
```shell
CMD ["executable","param1","param2"]
----------------------------------------------
ENTRYPOINT ["java" ,"notification.jar"]
ENTRYPOINT ["node","app.js"]
ENTRYPOINT ["/bin/sh","-c","date"]
ENTRYPOINT ["echo" ,"from ENTRYPOINT"]
```
-> exec form allows to set commands and parameters
-> when ENTRYPOINT is echo and we pass ls when runing command it willexecute echo
-> ENTRYPOINT command and parameters are not ignored when Docker container runs with command line parameters
-> ENTRYPOINT is always used 
-> If we have CMD then its used or this CMD can be changed by run 

```shell
ENTRYPOINT ["echo","hello from"]
CMD ["cmd instruct"]
---------------------------------
docker run entry 
-op--hello from cmd instruct
docker run entry "from run arg"
-op--hello from from run arg
```
-> based on above OP CMD will be providing param to ENTRYPOINT and it can be changed from run  
-> THIS WILL WORK only in SHELL FORM 
```shell
ENTRYPOINT echo "hello from shell form"
CMD ["cmd instruct"]
--------------------
docker run entry
docker run entry "from run arg"
-op-for both ->hello from shell form
```

-> CMD after ENTRYPOINT is to provide default-agrs
-> ENTRYPOINT is Also Overridable
```shell
sudo docker run --entrypoint [new_command] [docker_image]
----------------------------
docker run --entrypoint echo entry  "i am overridding default entry point"
-op-i am overridding default entry point
```
https://www.ctl.io/developers/blog/post/dockerfile-entrypoint-vs-cmd/
https://www.ctl.io/developers/blog/post/gracefully-stopping-docker-containers/
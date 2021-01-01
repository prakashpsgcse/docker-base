#RUN
-> RUN will execute cmds in new layer 
-> new layer will be used in next step
-> using RUN we can install app & Packages 
-> available in 2 forms

###Shell Form 
```shell
RUN <command>
```
this is given to "bin/sh -c"

###Exec Form
```shell
RUN ["executable", "param1", "param2"]
```
-> Multiple cmds can be run in single by using "\"

```shell
RUN echo "I am from shell form"
RUN ["bin/sh","-c","echo I am from exec form"]
```
-> Alpine apk [Alpine Linux package manager]
```shell
apk add pkgName
apk add pkgName1 pkgName2
apk upgrade
apk cache clean
```
-> cache location /var/cache/apk/, /var/lib/apk/ or /etc/apk/cache/
-> To reducer space after installing package its better to remove it from chache 
-> no-cache will not cache pkgs only 
```shell
--no-cache ==== [after installing rm -rf /var/cache/apk/*]
RUN apk add --no-cache curl
```
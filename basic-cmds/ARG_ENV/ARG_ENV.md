#ARG 
-> used only when building image (not available in run time /containers)
-> its var and user can pass running build command 
```shell
  ARG <name>[=<default value>]
  --build-arg <varname>=<value>
```
-> We can have ARG before FROM 
-> we can use ARG to set ENV 
```shell
ENV env_name=${arg_var:[-] default value}
ARG kafkav=1.0
ENV kafka_version=${kafkav:2.0}
```
-> Few predefined ARG's available like HTTP_PROXY etc
-> Auto Platform ARG is also available like 
 ```shell
TARGETPLATFORM
TARGETARCH
BUILDOS
```
#ENV 
-> sets env var in both build & container 
-> we can check by doing docker inspect
```shell
 "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "zk_version=3.4.5",
                "zk1=123",
                "zk2=345"
            ]
```
-> check printenv inside container 
```shell
# printenv
HOSTNAME=b59f788cde66
SHLVL=1
HOME=/root
zk1=123
zk_version=3.4.5
zk2=345

```

-> we can change or create new env var on runtime 

```shell
docker run -it -d -e zk1=999 -e newenv=fromruntime 59b95cbd7fbc sh

-------------
/ # printenv
newenv=fromruntime
HOSTNAME=f1484d7befba
SHLVL=1
HOME=/root
zk1=999
zk_version=3.4.5
zk2=345
TERM=xterm
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/

```
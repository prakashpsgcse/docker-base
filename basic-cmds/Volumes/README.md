#DATA
-> by default data/file created inside container will be lost 
-> not movable from hostmachine 
-> data dosent presist when container dies 
#Options 
 1. volumes 
 2. bind mounts
 3. tmpfs

-> both case data exposed as directory or file inside container
    
###Volumes
-> stored inside host machine managed by docker 
-> loc /var/lib/docker/volumes/
###Bind mounts
->created anywhere in host
->non-docker also can access
###tmpfs
-> tmpfs mounts are stored in the host system’s memory only, and
    are never written to the host system’s filesystem.


-> lets run tomcat and create file called "prakash-volume-test.txt"
-> When i search in host machine i will find it in 
```shell
docker run -d tomcat
docker exec -it tomcat sh
docker exec -it 4b509692f235 sh
touch prakash-volume-test.txt
----------------------------------------------
find / -name prakash-volume-test.txt
/var/lib/docker/overlay2/ab6276e47163aeb3045d03c5889fed941a8dbbe9f2d65a6072e032ad8691d8d5/diff/opt/tomcat/prakash-volume-test.txt
/var/lib/docker/overlay2/ab6276e47163aeb3045d03c5889fed941a8dbbe9f2d65a6072e032ad8691d8d5/merged/opt/tomcat/prakash-volume-test.txt
```
-> this will be removed after container is removed

####With volume 
->
```shell
docker run -d -v /data/tomcat tomcat

----------------------------------------
find / -name prakashtest.txt
/var/lib/docker/volumes/ec0670c1530c735e96c6f1c66b438b14e9c28ffc24e4a92dd274cd14bf955b2a/_data/prakashtest.txt
```
-> this is not removed after container killed 

-> Create a volume and attach 
```shell
docker volume create prakash-vol1
docker run -d -v prakash-vol1:/data/tomcat tomcat
```
-> Automatically create volume 
```shell
docker run -d -v prakash-tomcat-vol:/data/tomcat tomcat
--------------------------
/var/lib/docker/volumes/prakash-tomcat-vol/_data/prakash-volume-test-2.txt
```
-> Both will create volume 
```shell
[root@localhost prakash]# docker volume ls
DRIVER              VOLUME NAME
local               57f8c730f014561cce538e1cdfbbeb0d5d226583c6a21b1e24a64510dc7d8658
local               prakash-data1
local               prakash-tomcat-vol
```


##Volumes
create volume 
```shell
docker volume create {volume_name}
```
Dir created in 
```shell
/var/lib/docker/volumes/{vol_name}
```
##Bind mount 
-> first create dir in host machine 
-> give enough permissions 
-> use this format 
```shell
docker run -d -v {host_source}:{container_dest} tomcat
----------------------------------------------------------------
docker run -d -v /home/prakash/Documents/temp:/data/tomcat tomcat
```
##Tmpfs 
-> files created outside container layer [memory]
-> can't share between containers 
-> if container stops its removed 
```shell
docker run -f -it --tmpfs {dir} {image}
-----------------------------
docker run -d -it  --tmpfs /app tomcat
```
 
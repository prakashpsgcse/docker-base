# WORKDIR 

 -> Working directory of Docker Container at any point of time 

 -> Whatever command [RUN, CMD, ADD, COPY, or ENTRYPOINT] you run it will be executed from this dir 

 -> If the WORKDIR doesn’t exist, it will be created , it will go to root "/"
 
 -> Always use absolute paths for your WORKDIR

```
FROM ubuntu
RUN echo "building docker image from :" 
RUN pwd
RUN touch hello.txt
RUN ls
WORKDIR /users/prakash/app
RUN pwd
RUN touch hello.txt
RUN ls
CMD ["echo","Image created"] 
```

```
Status: Downloaded newer image for ubuntu:latest
Step 2/10 : RUN echo "building docker image from :"
building docker image from :
Step 3/10 : RUN pwd
/
Step 4/10 : RUN touch hello.txt
Step 5/10 : RUN ls
bin
boot
dev
etc
hello.txt
Step 6/10 : WORKDIR /users/prakash/app
Step 7/10 : RUN pwd
/users/prakash/app
Step 8/10 : RUN touch hello.txt
Step 9/10 : RUN ls
hello.txt
Step 10/10 : CMD ["echo","Image created"]
```

 -> we can have a multiple WORKDIR
 
 -> It will get created inside parent WORKDIR [relative path to previous WORKDIR]
 
 ```
 WORKDIR /users/prakash/app
RUN pwd
WORKDIR kafka
RUN pwd
```
 
 ```
Step 6/12 : WORKDIR /users/prakash/app
Step 7/12 : RUN pwd
/users/prakash/app
Step 8/12 : WORKDIR kafka
Step 9/12 : RUN pwd
/users/prakash/app/kafka
 ```

```
WORKDIR /users/prakash/app
RUN pwd
WORKDIR kafka
RUN pwd
WORKDIR ../zookeeper
RUN pwd
```

```
Step 10/14 : WORKDIR ../zookeeper
Step 11/14 : RUN pwd
/users/prakash/app/zookeeper 
```

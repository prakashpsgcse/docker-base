# Build 

 -> When you issue a docker build command, the current working directory is called the build context.
 -> Current directly and files will be sent to docker deamon 
 
 ```
 docker build -t makedir -f simple_cd .
 Sending build context to Docker daemon  3.072kB
 ```
 
# COPY
 -> copy files/Dir from <src> to <dest>
 -> works only in local file sys [not url ]
 -> just copy no extract/unzip 
 
 ```
 COPY <src>... <dest>
 COPY ["<src>",... "<dest>"] (this form is required for paths containing whitespace)
```

 -> copy works only inside "context" bcoz that what sent to deamon 
 -> src is dir then everything is coppied 
 -> if dest dosent exits then its created 
 
 
 ```
FROM ubuntu
RUN echo "building docker image from"
RUN pwd
WORKDIR /apps/install/kafka
COPY sample.sh .
RUN ls
```

```
[root@localhost build]# docker build .
Sending build context to Docker daemon  3.584kB
Step 1/6 : FROM ubuntu
Step 2/6 : RUN echo "building docker image from"
Step 3/6 : RUN pwd
/
Step 4/6 : WORKDIR /apps/install/kafka
Step 5/6 : COPY sample.sh .
Step 6/6 : RUN ls
sample.sh
/apps/install/kafka

```
 
 
 ```
 COPY kafka /apps/install/kafka
 ```
 
  -> full kafka folder is copied 
  
 ```
RUN ls /apps/install/kafka
LICENSE
NOTICE
bin
config
libs
site-docs
 ```
 
# ADD
 
 -> copy files/Dir or remote file from URL from <src> to <dest>
 
 -> Copy a tarball from the local storage and extract it automatically inside a destination in the Docker image
 
 -> <src> is a remote file URL, the destination will have permissions of 600
 
 -> copy works only inside "context" bcoz that what sent to deamon 
 
 -> ADD will only work on tar NOT on .tgz , zip 
 
 -> .zip or tgz add extra layer 
 
 -> for .zip RUN unzip [First copy to docker then unzip]
 
 ```
 ADD kafka_2.11-2.2.2.tgz .
RUN ls
ADD kafka.zip .
RUN ls
```
 
 
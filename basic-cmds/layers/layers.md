# layers 

 -> Change on Image / intermediate image 
 -> Every FROM, RUN, COPY, etc will create layers 
 -> its filesystem changes 
 -> Docker uses layer cache to optimize builds
 -> ex: RUN and copy if cmds and content not changed from previous build , same layer[cached] is used 
 ->
 
 
 
 ```
FROM ubuntu
WORKDIR /apps/install/kafka
RUN apt-get update
RUN apt-get install unzip
RUN apt-get install -y wget 
COPY Sample.txt .
RUN ls
 ```
 
 ```
 Sending build context to Docker daemon  4.096kB
Step 1/7 : FROM ubuntu
 ---> d70eaf7277ea
Step 2/7 : WORKDIR /apps/install/kafka
 ---> Using cache
 ---> b631f3bd3d4c
Step 3/7 : RUN apt-get update
 ---> Using cache
 ---> 85dfca0411ec
Step 4/7 : RUN apt-get install unzip
 ---> Using cache
 ---> a7fa69a0d5bc
Step 5/7 : RUN apt-get install -y wget
 ---> Running in 33dfd95e17ca
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  ca-certificates libpsl5 libssl1.1 openssl publicsuffix
The following NEW packages will be installed:
  ca-certificates libpsl5 libssl1.1 openssl publicsuffix wget
0 upgraded, 6 newly installed, 0 to remove and 4 not upgraded.
Need to get 2603 kB of archives.
After this operation, 7243 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal/main amd64 libssl1.1 amd64 1.1.1f-1ubuntu2 [1318 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal/main amd64 openssl amd64 1.1.1f-1ubuntu2 [621 kB]
Get:3 http://archive.ubuntu.com/ubuntu focal-updates/main amd64 ca-certificates all 20201027ubuntu0.20.04.1 [153 kB]
Unpacking libssl1.1:amd64 (1.1.1f-1ubuntu2) ...
Unpacking libpsl5:amd64 (0.21.0-1ubuntu1) ...
Selecting previously unselected package publicsuffix.
Preparing to unpack .../4-publicsuffix_20200303.0012-1_all.deb ...
Unpacking publicsuffix (20200303.0012-1) ...
Selecting previously unselected package wget.
Preparing to unpack .../5-wget_1.20.3-1ubuntu1_amd64.deb ...
Unpacking wget (1.20.3-1ubuntu1) ...
Setting up libpsl5:amd64 (0.21.0-1ubuntu1) ...
debconf: falling back to frontend: Teletype
Setting up openssl (1.1.1f-1ubuntu2) ...
Setting up publicsuffix (20200303.0012-1) ...
Setting up wget (1.20.3-1ubuntu1) ...

Running hooks in /etc/ca-certificates/update.d...
done.
Removing intermediate container 33dfd95e17ca
 ---> a09550dddd4f
Step 6/7 : COPY Sample.txt .
 ---> d1ad1b69f727
Step 7/7 : RUN ls
 ---> Running in 60c2d4769d21
Sample.txt
Removing intermediate container 60c2d4769d21
 ---> 4c9e0214e87f
Successfully built 4c9e0214e87f
Successfully tagged layer-test:latest
```

Checking history 

```
[root@localhost overlay2]# docker history 4c9e0214e87f
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
4c9e0214e87f        4 minutes ago       /bin/sh -c ls                                   0B                  
d1ad1b69f727        4 minutes ago       /bin/sh -c #(nop) COPY file:df55d350a413729c…   15B                 
a09550dddd4f        4 minutes ago       /bin/sh -c apt-get install -y wget              7.63MB              
a7fa69a0d5bc        7 minutes ago       /bin/sh -c apt-get install unzip                1.12MB              
85dfca0411ec        7 minutes ago       /bin/sh -c apt-get update                       26MB                
b631f3bd3d4c        7 minutes ago       /bin/sh -c #(nop) WORKDIR /apps/install/kafka   0B                  
d70eaf7277ea        3 weeks ago         /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
<missing>           3 weeks ago         /bin/sh -c mkdir -p /run/systemd && echo 'do…   7B                  
<missing>           3 weeks ago         /bin/sh -c [ -z "$(apt-get indextargets)" ]     0B                  
<missing>           3 weeks ago         /bin/sh -c set -xe   && echo '#!/bin/sh' > /…   811B                
<missing>           3 weeks ago         /bin/sh -c #(nop) ADD file:435d9776fdd3a1834…   72.9MB
```

IMAGE -> intermeditae images /layers 
 -> use docker dive to see filesystem changes on image 
 
 -> Next build uses cache [compare intermediate layers ID ]
 
 ```[root@localhost layers]# docker build -t layer-test .
Sending build context to Docker daemon  758.3kB
Step 1/7 : FROM ubuntu
 ---> d70eaf7277ea
Step 2/7 : WORKDIR /apps/install/kafka
 ---> Using cache
 ---> b631f3bd3d4c
Step 3/7 : RUN apt-get update
 ---> Using cache
 ---> 85dfca0411ec
Step 4/7 : RUN apt-get install unzip
 ---> Using cache
 ---> a7fa69a0d5bc
Step 5/7 : RUN apt-get install -y wget
 ---> Using cache
 ---> a09550dddd4f
Step 6/7 : COPY Sample.txt .
 ---> Using cache
 ---> d1ad1b69f727
Step 7/7 : RUN ls
 ---> Using cache
 ---> 4c9e0214e87f
Successfully built 4c9e0214e87f
Successfully tagged layer-test:latest
 ```
 
 
 
 
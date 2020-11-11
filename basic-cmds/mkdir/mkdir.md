#mkdir

 -> create a directory 
 
 -> use -p to create with parrent dir or it will fail

```
 RUN mkdir /prakash
 RUN mkdir -p /users/prakash
 ```
 
 ```
Step 3/8 : RUN mkdir /prakash
Step 4/8 : RUN mkdir -p /user/prakash
Step 5/8 : RUN pwd
/
Step 6/8 : RUN touch hello.txt
Step 7/8 : RUN ls
bin
boot
dev
etc
hello.txt
```

-> just created dir 

-> file created in "/" not in "/user/prakash"

```
RUN cd /user/prakash
RUN touch hello.txt
RUN ls
```

-> still it creates in "/" directory 

-> cd will work only in single RUN (Check RUN spec)

```
RUN cd /user/prakash && touch hello_from_single_cmd.txt && pwd && ls
```
```
FROM ubuntu
RUN echo "building docker image from :" 
RUN mkdir /prakash

RUN mkdir -p /user/prakash
RUN pwd
RUN cd /user/prakash && touch hello_from_single_cmd.txt && pwd && ls
RUN touch hello.txt
RUN ls
RUN ls /user/prakash
CMD ["echo","Image created"]
```



Out put 

```Sending build context to Docker daemon  4.608kB
Step 1/10 : FROM ubuntu
Step 2/10 : RUN echo "building docker image from :"
Step 3/10 : RUN mkdir /prakash
Step 4/10 : RUN mkdir -p /user/prakash
Step 5/10 : RUN pwd
Step 6/10 : RUN cd /user/prakash && touch hello_from_single_cmd.txt && pwd && ls
/user/prakash
hello_from_single_cmd.txt
Step 7/10 : RUN touch hello.txt
Step 8/10 : RUN ls
 ---> Running in a08c6af2eb23
bin
boot
dev
etc
hello.txt
mnt
opt
prakash
Step 9/10 : RUN ls /user/prakash
hello_from_single_cmd.txt
Step 10/10 : CMD ["echo","Image created"]
```
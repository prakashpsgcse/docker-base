#USER

##Linux
-> user Info Stored in  /etc/passwd file
-> Create user
```
adduser {username}
adduser prakash
Adding user `prakash' ...
Adding new group `prakash' (1000) ...
Adding new user `prakash' (1000) with group `prakash' ...
Creating home directory `/home/prakash' ...

    Changing the user information for prakash
    Enter the new value, or press ENTER for the default
    Full Name []: prakash
    Room Number []: 101
    Work Phone []: 100139494
    Home Phone []: 9749347934
    Other []: 34394783947
    ```
-> User added in /etc/passwd file
```
   prakash:x:1000:1000:prakash,101,100139494,9749347934,34394783947:/home/prakash:/bin/bash    
```

->Users password is stored in  /etc/shadow file
  ```aidl
# cat /etc/shadow
 root:*:18151:0:99999:7:::
 daemon:*:18151:0:99999:7:::
 prakash:$6$ZZm7N3Vs$jg.hp7foEA5TKkb3pLjK28m.8x0nd0D1KM/7GO7t0mAOXbHpO0bxy.2iENxl5HnpPfk3O2RCcpJ8Jzl9dqD2S0:18609:0:99999:7:::
```
-> Groupinfo stored in

```
cat group
 root:x:0:
 daemon:x:1:
 bin:x:2:
 sys:x:3:
 prakash:x:1000:
```
-> Adding Group
```
groupadd {GroupName}
groupadd kafka

 prakash:x:1000:
 kafka:x:1001:
```

-> Add user to group
```
adduser {user} {group}
adduser prakash kafka
 Adding user `prakash' to group `kafka' ...
 kafka:x:1001:prakash -> after adding prakash to kafka
```



#Permission 
Read/r-4
Write/w-2
Execute/x-1

-> File or Dir permission 
 ```
 user(owner)/group/everyone(users not part of user/group)
 
```

-> Change file permission 

```
chmod {permission} {file/dir}
chgrp {permission} {file/dir}
chown {permission} {file/dir}
For Folder [chmod -R .....]
```

Example 

```

# touch props.txt
 # ls -l | grep props
 -rw-r--r-- 1 root root 0 Dec 13 13:36 props.txt
 # chmod 751 props.txt
 # ls -l | grep props
 -rwxr-x--x 1 root root 0 Dec 13 13:36 props.txt
 # chown prakash props.txt
 # ls -l | grep props
 -rwxr-x--x 1 prakash root 0 Dec 13 13:36 props.txt
 # chgrp kafka props.txt
 # ls -l | grep props
 -rwxr-x--x 1 prakash kafka 0 Dec 13 13:36 props.txt
 # su prakash
 
 $ ls -l | grep prop
 -rwxr-x--x 1 prakash kafka 6 Dec 13 13:40 props.txt
 $ whoami
 youtube
 $ echo "i can add .bcoz i am part of kafka group" >> props.txt
 sh: 5: cannot create props.txt: Permission denied
 $ cat props.txt
 hello
```



-> Short permissions 
->  {u/g/o} {+/-/=} {r/w/e}

```

# touch props.txt
 # ls -l | grep props
 -rw-r--r-- 1 root root 0 Dec 13 13:36 props.txt
 # chmod 751 props.txt
 # ls -l | grep props
 -rwxr-x--x 1 root root 0 Dec 13 13:36 props.txt
 # chown prakash props.txt
 # ls -l | grep props
 -rwxr-x--x 1 prakash root 0 Dec 13 13:36 props.txt
 # chgrp kafka props.txt
 # ls -l | grep props
 -rwxr-x--x 1 prakash kafka 0 Dec 13 13:36 props.txt
 # su prakash
 
 $ ls -l | grep prop
 -rwxr-x--x 1 prakash kafka 6 Dec 13 13:40 props.txt
 $ whoami
 youtube
 $ echo "i can add .bcoz i am part of kafka group" >> props.txt
 sh: 5: cannot create props.txt: Permission denied
 $ cat props.txt
 hello
```
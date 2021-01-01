#Gracefull shutdown 

## Stopping Container
-> **docker stop** -> will send SIGTERM to PID 1 (root process)
-> If process is not excited in time/10sec SIGKILL will be sent to kernal 
-> we can use docker stop ----time=30 
-> docker deamon will wait for 30 sec before sending SIGKILL to kernal
-> **docker kill** -> docker deamon will send SIGKILL to kernal directly
-> but docker kill accepts flag --signal .we can pass like SIGINT/SIGSTOP
-> Examle SIGWINCH on httpd2 used for gracefull shutdown .so use it like --signal SIGWINCH
  if you just use docker stop/kill (SIGTERM/KILL) will kill tomcat and all processing req will be terminated


-> **kubectl delete pod** also send SIGTERM signal
-> terminationGracePeriodSeconds for k8s

-> exec command in linux creates new process 
-> it replace the curent bash/sh process [no new process]

#SHELL 
-> ANy cmd is shell creates sub-shell
-> new Process created/forked  to execute cmd 
-> to check **pstree -p**
-> to check current shell pid **echo $$**
-> lets say current PID is 100 when you run any cmd with exec java hello that PID will be 100
-> SIGUSR1,2 are user defined signals [can be used in user prgm]

##TRAP
-> defines & activates handlers on SIGNELS
->trap -l [for checking all signals]
-> to send signals to process use kill 
-> To define a trap 
```shell
trap {function} {signal}
```
```shell
kill -{#Signal} {PID}
--------------------------
SIGUSR1=>10
SIGTERM=>15
SIGKILL=>9
kill -15  22137
kill -10 22137
-------------op--------------
testing signals
22137
waiting for signals
waiting for signals
Received USRSIG1
waiting for signals
waiting for signals
waiting for signals
waiting for signals
waiting for signals
received SIGTERM . willbe terminating 
waiting for signals
waiting for signals
waiting for signals
Killed

```
# docker-base
explain docker basic and advanced concepts 

# Basics 
   [link to docker basics](https://docs.docker.com/engine/reference/builder/)
   
   [link for best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
   
##### Start Docker 
      systemctl start docker 
##### Remove images 
      docker rim {image}
##### Remove container 
      docker rm {container}
##### Remove all (image/container/etc)
      docker system prune -a
##### List containers 
      docker ps -a
##### To remove all stopped containers 
     docker rm $(docker ps -a -q)
      

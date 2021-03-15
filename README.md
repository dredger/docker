# DOCKER example

docker && docker compose examples


# INSTALL 

##  install docker and docker compose

https://docs.docker.com/get-docker/

https://docs.docker.com/compose/install/

## edit hosts file 

### add following lines in the hosts file 

127.0.0.1 test.local
127.0.0.1 sub.test.local
127.0.0.1 pma.local

#### Win 10 hosts file location 
 
 run editor with administrator rights 
 C:\Windows\System32\drivers\etc\hosts


# RUN 

## run docker container
 
 cd d:\docker_folder\;
 docker-compose up --build   --remove-orphans

## install vendors if required

cd /var/www/html/; php composer.phar install;

## connect to container (power shell or putty):   

docker exec -it drew_web_php bash



 
 
 
 

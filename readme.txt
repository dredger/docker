--- install docker and docker compose ---

https://docs.docker.com/get-docker/
https://docs.docker.com/compose/install/

Docker Desktop: https://prnt.sc/vvaau2

--- docker for php storm ---
setup: https://prnt.sc/vva5x9
run: https://prnt.sc/vva6cs
list: https://prnt.sc/vvaae6
add dir docker to the excluded path: https://prnt.sc/vvag3w

--- prepare host file ---
Win host file location: c:\Windows\System32\drivers\etc\hosts

127.0.0.1 mozeo.local	
127.0.0.1 dashboard.mozeo.local
127.0.0.1 pma.mozeo.local


----- run docker container ---
cd docker/;
docker-compose up --build   --remove-orphans

install vendors if required
cd /var/www/html/; php composer.phar install;

---- execute php script ----

connect to container (power shell or putty):   docker exec -it mozeo_container_php bash

composer:
 php composer.phar -v
 php composer.phar install
 php composer.phar update


--- DB ---
user: root
password: root
host: localhost
por:3306

--- nginx ---
 /etc/init.d/nginx restart

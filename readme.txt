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

127.0.0.1 test.local	
127.0.0.1 sub.test.local
127.0.0.1 pma.local (root:root)


----- run docker container ---
cd docker/;
docker-compose up --build   --remove-orphans

install vendors if required
cd /var/www/html/; php composer.phar install;

---- execute php script ----

connect to container (power shell or putty):   docker exec -it drew_web_php bash

composer:
 php composer.phar -v
 php composer.phar install
 php composer.phar update


--- DB ---
host_docker: drew_web_maria
host_external: localhost
user: root
password: root
host: localhost	
por:3306

--- nginx ---
 /etc/init.d/nginx restart


SELECT
  variable_name,
  variable_value AS innodb_log_buffer_size_bytes,
  ROUND(variable_value / (1024*1024)) AS innodb_log_buffer_size_mb
FROM information_schema.global_variables
WHERE variable_name LIKE  'innodb_buffer_pool_size';

Show variables LIKE  '%innodb_buffer';

docker exec -it drew_web_php bash
docker exec -it drew_web_maria bash

https://phpforus.com/how-to-make-mysql-run-fast-with-ext4-on-ubuntu/
$ sudo gedit /etc/fstab
UUID=b87de212-52ca-4600-9e30-6e80e24df1ed / ext4 errors=remount-ro,barrier=0 0 1




 check Hyper-V
  Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V
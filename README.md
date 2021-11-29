![Docker Pulls](https://img.shields.io/docker/pulls/kaneymhf/docker-osticket) [![](https://images.microbadger.com/badges/image/kaneymhf/docker-osticket.svg)](https://microbadger.com/images/kaneymhf/docker-osticket "Get your own image badge on microbadger.com") ![Docker Stars](https://img.shields.io/docker/stars/kaneymhf/docker-osticket) [![](https://images.microbadger.com/badges/version/kaneymhf/docker-osticket.svg)](https://microbadger.com/images/kaneymhf/docker-osticket "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/license/kaneymhf/docker-osticket.svg)](https://microbadger.com/images/kaneymhf/docker-osticket "Get your own license badge on microbadger.com")

# Docker Osticket

This images contains apache 2.4 and php 7.34on port 80, based on CentOS 7 Linux, ready to serve osTicket 1.15

# Docker Informations

* This image expose the following port

| Port | Usage |
|:----:|:-----:|
|  80/tcp  | HTTP Web application |

* The following volume is exposed by this image

|         Volume        |          Usage          |
|:---------------------:|:-----------------------:|
|  /var/www/html  |  The files path of osTicket |


# Usage

## Docker-compose Specific configuration examples

```yml
version: "3.2"

services:
#Mysql Container
  mysql:
    image: mariadb:10.4
    container_name: mysql
    hostname: mysql
    environment:
      - MYSQL_ROOT_PASSWORD=glpi
      - MYSQL_DATABASE=glpi
      - MYSQL_USER=glpi
      - MYSQL_PASSWORD=glpi
      - TZ=Etc/GMT+3
    volumes:
    - /path/to/data:/var/lib/mysql

#GLPI Container
  glpi:
    image: kaneymhf/docker-osticket
    container_name : osticket
    hostname: osticket
    ports:
      - "80:80"
    environment:
      - TZ=Etc/GMT+3
    volumes:
      - /path/to/files:/var/www/html
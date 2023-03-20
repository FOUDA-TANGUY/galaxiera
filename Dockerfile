FROM ubuntu
WORKDIR /app
ENV DEBIAN_FRONTEND=noninterative

# pour l 'installation des LAMP

RUN apt update && apt-get install -y apache2 php libapache2-mod-php mysql-server php-mysql && apt install -y php-curl php

RUN apt update && apt-get install -y apache2 php libapache2-mod-php mysql-server php-mysql && apt install -y php-curl php-gd php-intl php-json php-mbstring php-xml php-zip

# configuration de LAMP

WORKDIR /var/www/html

RUN apt update && apt install -y git && mkdir apache php mysql && git clone https://github.com/pertinent23/merix.git && mv ./index.html ./apache/index.html && echo "<?php phpinfo(); ?>" > ./php/index.php && echo "service mysql start && service apache2 start && sleep infinity" > ./launch
COPY ./php ./mysql

CMD ["/bin/bash","launch"]

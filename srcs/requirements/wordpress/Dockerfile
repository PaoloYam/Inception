FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget

RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql mariadb-client

#dwnld archive wp 
RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm wordpress-6.2.2-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

#INSTALL wp cli 
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/

#COPY in root directory
COPY conf/auto_config.sh /
RUN chmod +x auto_config.sh

COPY conf/wp-config.php /var/www/wordpress/wp-config.php

CMD ["./auto_config.sh"]

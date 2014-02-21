# Composable Stack Member for docker base
FROM        ubuntu:saucy
MAINTAINER  Ross Riley "riley.ross@gmail.com"

VOLUME ["/data/mysql"]


# Install MariaDB
RUN apt-get install software-properties-common
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
RUN add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/10.0/ubuntu saucy main'
RUN apt-get update
RUN apt-get -y install mariadb-server
RUN sed -i 's/^innodb_flush_method/#innodb_flush_method/' /etc/mysql/my.cnf
RUN sed -i "/^datadir*/ s|=.*|=/data/mysql|" /etc/mysql/my.cnf
RUN chown -R mysql:mysql /data/mysql
RUN mysql_install_db
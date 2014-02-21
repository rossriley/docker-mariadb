# Composable Stack Member for docker base
FROM        ubuntu:saucy
MAINTAINER  Ross Riley "riley.ross@gmail.com"

VOLUME ["/data/mysql"]


# Install MariaDB
RUN echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
RUN add-apt-repository 'deb http://mirrors.linsrv.net/mariadb/repo/5.5/ubuntu precise main'
RUN apt-get update
RUN apt-get -y install mariadb-server
RUN sed -i 's/^innodb_flush_method/#innodb_flush_method/' /etc/mysql/my.cnf
RUN sed -i "/^datadir*/ s|=.*|=/data/mysql|" /etc/mysql/my.cnf
RUN chown -R mysql:mysql /data/mysql
RUN mysql_install_db
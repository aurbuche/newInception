FROM	debian:buster

LABEL	maintainer="<aurbuche@student.42lyon.fr>"

RUN		apt-get -y update && apt-get -y upgrade && \
		apt-get -y install mariadb-server

COPY	wpDatabase.sql /
COPY	mariadb-server.cnf /
COPY	script.sh ./

EXPOSE	3306

CMD	mysql && sh script.sh


FROM	debian:buster

LABEL	maintainer="<aurbuche@student.42lyon.fr>"

RUN		apt-get -y update && apt-get -y upgrade && \
		apt-get -y install mariadb-server

COPY	wpdatabase.sql /
COPY	my.cnf /
COPY	script.sh ./

ARG		DB_PASSWORD
ARG		WP_USER
ARG		WP_DATABASE
ARG		WP_PASSWORD
ARG		HOSTNAME
ARG		SUPER_USER_PASSWORD
ARG		USER_PASSWORD

RUN		sh ./script.sh
RUN		rm script.sh

ENTRYPOINT [ "mysqld" ]
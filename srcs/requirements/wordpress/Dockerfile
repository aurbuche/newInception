FROM	debian:buster

LABEL	maintainer="<aurbuche@student.42lyon.fr>"

RUN		apt-get -y update && apt-get -y upgrade && \
		apt-get install -y php php-fpm php-cli php7.3-mysql wget

COPY	./script.sh ./
COPY	./www.conf /

ARG		WP_USER
ARG		WP_DATABASE
ARG		WP_PASSWORD
ARG		HOSTNAME

RUN		./script.sh
RUN		rm ./script.sh

EXPOSE	9000

ENTRYPOINT	["./usr/sbin/php-fpm7.3", "-F"]
FROM	debian:buster

LABEL	maintainer="<aurbuche@student.42lyon.fr>"

RUN		apt-get -y update && apt-get -y upgrade && \
		apt-get install -y php php-fpm php-cli php7.3-mysql wget

COPY	./www.conf /
COPY	./script.sh /

ARG		WP_USER
ARG		WP_DATABASE
ARG		WP_PASSWORD
ARG		HOSTNAME

RUN		sh ./script.sh
RUN		rm script.sh

ENTRYPOINT	["./usr/sbin/php-fpm7.3", "-F"]
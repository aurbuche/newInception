FROM	debian:buster

LABEL	maintainer="<aurbuche@student.42lyon.fr>"

RUN		apt-get	update && apt-get -y upgrade 2> /dev/null
RUN		apt-get -y install nginx openssl wget

RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt  -subj "/C=FR/ST=Auvegne Rhone Alpe/L=Lyon/O=42Lyon/CN=aurbuche"

COPY	nginx.conf /etc/nginx/conf.d

EXPOSE	443

ENTRYPOINT	["nginx", "-g", "daemon off;"]

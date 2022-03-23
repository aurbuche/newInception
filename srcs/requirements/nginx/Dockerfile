FROM	debian:buster

LABEL	maintainer="<aurbuche@student.42lyon.fr>"

RUN		apt-get	update && apt-get -y upgrade 2> /dev/null
RUN		apt-get -y install nginx openssl wget

COPY	nginx.conf /etc/nginx/conf.d

EXPOSE	443

ENTRYPOINT	["nginx", "-g", "daemon off;"]

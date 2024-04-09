#Get debian version
FROM debian:bullseye

LABEL version="1.0"
#download packets
RUN apt update -y && \
    apt install nginx openssl curl -y && \
    mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx-private.key -out /etc/nginx/ssl/nginx-cert.crt -batch 
#Copy local files to docker nginx path

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx.sh /etc/nginx/nginx.sh

RUN chmod +x /etc/nginx/nginx.sh

EXPOSE 443

STOPSIGNAL SIGQUIT

ENTRYPOINT ["./etc/nginx/nginx.sh"]

#CMD ["nginx", "-g", "daemon off;"]
#CMD ["nginx", "-g", "daemon off;"]
# HACK tail -F 

CMD ["tail", "-f", "/dev/null"]

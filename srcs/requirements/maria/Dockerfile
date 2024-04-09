#Get debian version
FROM debian:bullseye

LABEL version="1.0"
#download packets
RUN apt update -y && \
    apt install mariadb-server mariadb-client vim 

EXPOSE 3306

STOPSIGNAL SIGQUIT


# HACK tail -F 

CMD ["tail", "-f", "/dev/null"]

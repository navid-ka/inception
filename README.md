Add to /etc/hosts local ip of docker 
ip a | grep inet

docker build -t name:tag

docker inspect \
  -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' IDCONTAINER
docker ps 

docker images 

docker stop IDCONTAINER

docker rmi img:tag --force

docker build -t nginx:tag .

docker run -dit img:tag

docker run -it img:tag bash


## https://dba.stackexchange.com/questions/103625/how-to-reinitialise-var-lib-mysql-files
mkdir /var/lib/mysql
mkdir /var/lib/mysql/mysql
chown -R mysql:mysql /var/lib/mysql 

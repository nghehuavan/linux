docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker volume prune -a -f
service docker stop
rc-update delete docker boot
apk del docker docker-compose


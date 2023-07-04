## wget --no-cache https://raw.githubusercontent.com/nghehuavan/linux/main/alpine/install.sh
## chmod +x install.sh

echo http://dl-cdn.alpinelinux.org/alpine/v3.18/main > /etc/apk/repositories
echo http://dl-cdn.alpinelinux.org/alpine/v3.18/community >> /etc/apk/repositories
apk update
apk add docker docker-compose
rc-update add docker boot
addgroup root docker
service docker start

echo Waiting 10s for docker starting ...
sleep 10
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

echo ============ CURRENT IP ============
ifconfig eth0
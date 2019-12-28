# source[1]: https://lehrerfortbildung-bw.de/st_digital/netz/virtual/container/docker/index.html
# source[2]: https://hub.docker.com/r/ownyourbits/nextcloudpi-x86
# install docker
apt-get install docker.io docker-compose
# test install:
# docker run hello-world
# pihole aufsetzen
docker pull pihole/pihole
mkdir -p /srv/docker/pihole
cd /srv/docker/pihole
curl -O https://raw.githubusercontent.com/pi-hole/docker-pi-hole/master/docker_run.sh
# change ports and remove timezone
sed -i 's/80:80/81:80/g' docker_run.sh
sed -i 's/443:443/444:443/g' docker_run.sh
sed -i '/TZ=/d' docker_run.sh
chmod +x docker_run.sh
./docker_run.sh
# fix webserver expecting localhost
# source: https://github.com/pi-hole/pi-hole/issues/2195 (unitpas)
docker exec -it pihole bash
apt-get update
apt-get install nano
sed -i 's/$serverName = htmlspecialchars($_SERVER["HTTP_HOST"]);/$serverName = htmlspecialchars($_SERVER["SERVER_ADDR"]);/g' /var/www/html/pihole/index.php
exit
# make run automatic at startup (if docker doesn't)
# cd /etc/systemd/system/
# curl -O https://raw.githubusercontent.com/gXeeXqBHuHDFTaEnff3Z/blue-team-SOHO-basics/master/server/pihole.service
# systemctl enable pihole.service 
# nextcloud aufsetzen
docker pull ownyourbits/nextcloudpi-x86
mkdir -p /srv/docker/nextcloud/data
mkdir -p /srv/docker/nextcloud/config
cd /srv/docker/nextcloud/
# docker run -d -p 4443:4443 -p 443:443 -p 80:80 -v ncdata:/data --name nextcloudpi ownyourbits/nextcloudpi-x86 10.0.0.10
curl -O https://raw.githubusercontent.com/gXeeXqBHuHDFTaEnff3Z/blue-team-SOHO-basics/master/server/nextcloudpi_docker_run.sh
chmod +x nextcloudpi_docker_run.sh
./nextcloudpi_docker_run.sh



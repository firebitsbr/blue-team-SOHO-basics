# create /etc/pihole/setupVars.conf
curl -O -L https://raw.githubusercontent.com/gXeeXqBHuHDFTaEnff3Z/blue-team-SOHO-basics/master/server/pihole/setupVars.conf
sudo mkdir /etc/pihole/
sudo mv setupVars.conf /etc/pihole/setupVars.conf
# start install using given settings
sudo curl -L https://install.pi-hole.net | bash /dev/stdin --unattended

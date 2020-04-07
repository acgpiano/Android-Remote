#!/data/data/com.termux/files/usr/bin/sh

# update
apt update && apt upgrade -y --force-yes

# install tsudo
pkg install tsu openssh -y

# install frp
cd ~
tsudo mv ./storage/downloads/frpc ./
tsudo mv ./storage/downloads/frpc.ini ./
tsudo mv ./storage/downloads/run.sh ./
tsudo chmod +x ./frpc
chmod +x ./s
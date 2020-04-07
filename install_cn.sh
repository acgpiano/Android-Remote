#!/data/data/com.termux/files/usr/bin/sh
# 替换源
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
sed -i 's@^\(deb.*games stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable@' $PREFIX/etc/apt/sources.list.d/game.list
sed -i 's@^\(deb.*science stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list

# 更新源
apt update && apt upgrade -y --force-yes

# 安装root
pkg install tsu openssh -y

# 安装frp
cd ~
tsudo mv ./storage/downloads/frpc ./
tsudo mv ./storage/downloads/frpc.ini ./
tsudo mv ./storage/downloads/run.sh ./
tsudo chmod +x ./frpc
chmod +x ./s
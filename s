#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock

# open adb port, ssh
cd /system/bin
tsudo ./setprop service.adb.tcp.port 5555
tsudo ./stop adbd
tsudo ./start adbd
tsudo sshd

# open frp
cd ~
tsudo killall frpc
nohup tsudo ./frpc -c ./frpc.ini > ./log.txt 2>&1 &
killall crond
crond
## 介绍

该项目是一个纯安卓远控项目，无需连接电脑，只需要自己有***一台vps和一台root过的安卓机***，就可以达到teamviewer、向日葵手机远控和airdroid类似的效果。也可以用于自己搭建android服务器使用。

## 用途

各种需要远控的，比如放一个备用机到公司钉钉打卡，或者安卓手机服务器

## 原理

安卓adb可以使用ip加端口来进行调试，但是一般都是内网调试，如果通过frp把手机的端口映射外网，就可以直接通过公网连接调试，scrcpy项目是一个通过adb远程控制的项目，两者结合便可以完成公网远控。全程无需使用电脑就可以完成。

## 安装过程

### 0.Root安卓手机，自行搭建frp，学习安装scrcpy

[frp](https://github.com/fatedier/frp/releases)和[scrcpy](https://github.com/Genymobile/scrcpy)官网

### 1.安装termux

<https://f-droid.org/packages/com.termux/>

下载好后安装

### 2.安装frpc

注意：frpc的服务端和客户端必须保持版本一致

1. 下载和服务器frps版本一致的***arm***版frpc

   <https://github.com/fatedier/frp/releases>

2. 将手机supersu权限设置为永久授权，不弹窗

3. 将本项目***以下文件***和自行下载好的***frpc***以及配置好的***frpc.ini***复制到手机的Download目录

   install_cn.sh

   s

4. 打开termux app执行

```bash
# 获取存储权限
termux-setup-storage

# 复制安装脚本
mv ./storage/downloads/install.sh ~/
chmod +x ./install.sh

#执行安装脚本
./install.sh
```

安卓默认的调试端口为5555，所以要做的就是把5555端口映射到外网，具体frp配置文件写法		可以参考该项目的示例配置frpc_example.ini

如果需要修改安卓默认调试端口，请修改install_cn.sh里面的端口

### 3.配置ssh

```bash
# 修改$PREFIX/etc/ssh/sshd_config
# 添加以下选项允许root登录，不需要请忽略
PermitRootLogin yes
AllowUsers root
```

ssh默认端口为8022，请注意frpc的配置文件设置

### 4.使用方法

Android端启动：

```bash
# Termux HOME目录运行
./s
```

scrcpy远控客户端：

```bash
# 连接安卓
adb connect IP:PORT
# scrcpy控制
scrcpy
```

ssh:

```bash
ssh -p PORT root@IP
```

注意：运行后不可以关闭termux，每次重启手机后需要重新运行



### 5.其它选项

```bash
# 定时开关wifi
# 1.编辑定时任务
crontab -e

# 2.添加任务
# 每天7点开wifi
0 7 * * * tsudo su -c svc wifi enable
# 每天22点关wifi
0 22 * * * tsudo su -c svc wifi disable

# 每半个小时重启脚本
*/30 * * * * ~/s

# 完毕后启动定时人去
crond
```








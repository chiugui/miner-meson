# miner-meson

## 1.构建docker镜像更新

当meson程序更新时候需要更换meson代码，及更新dockerfile中的tar包下载地址。

```shell
cd miner-meson
vim Dockerfile
docker build -t chiugui/meson-daemon:latest .
docker push chiugui/meson-daemon:latest
```



## 2.使用docker-compose

注意：docker容器的网络采用的是host模式，即主机模式，使用宿主机网络，共用宿主机网卡，ip等属性都相同与宿主机。所以同一宿主机启用多个容器时，请将端口修改为不同端口。

```shell
#进入项目
cd miner-meson

#修改或创建config.txt文件中token为你自己的token，修改port端口，spacelimit为最大存储空间（单位为GB）
vim config.txt
token = rHnBw8WZibxvDw1Sae7+xx==
port = 39091
spacelimit = 40

#创建一个目录，容量大于40G，用于映射为存储spaceholder的数据
mkdir /meson-test
```

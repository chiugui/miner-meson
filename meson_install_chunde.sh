#!/bin/bash

cd /root
./meson-linux-amd64/meson service-stop
./meson-linux-amd64/meson service-remove
cd ~/
rm -fr ./meson-linux-amd64*

wget 'https://coldcdn.com/api/cdn/f2cobx/terminal/v2.5.2/meson-linux-amd64.tar.gz'
if (( $? != 0 ));then
#If the above link is abnormal, please try the backup link
    wget https://assets.meson.network:10443/static/terminal/v2.5.2/meson-linux-amd64.tar.gz 
        if (( $? != 0 ));then
        wget https://github.com/chiugui/miner-meson/raw/main/meson-linux-amd64.tar.gz
        fi
fi

tar -zxf meson-linux-amd64.tar.gz && cd ./meson-linux-amd64
sed -i 's#token = #token = k8D5frcA4CtJb7tidyo1aQ==#g'  ./config.txt
sed -i 's#port = #port = 22222#g' ./config.txt
sed -i 's#spacelimit =#spacelimit = 41#g' ./config.txt

./meson service-install
sleep 3
./meson service-start
cd /root/ && rm -f meson-linux-amd64.tar.gz

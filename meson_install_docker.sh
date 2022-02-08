#!/bin/bash
#for docker
systemctl start docker && systemctl enable docker
docker rm -f minermeson_meson_1
rm -fr /meson-tes*
cd /opt/
rm -fr miner-meson
git clone https://github.com/chiugui/miner-meson.git
cd miner-meson && docker-compose up -d

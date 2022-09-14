FROM centos:7
WORKDIR /
RUN yum install -y wget && yum clean all && wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.18/meson_cdn-linux-amd64.tar.gz' \
&& tar -zxf meson_cdn-linux-amd64.tar.gz && rm -f meson_cdn-linux-amd64.tar.gz && cd ./meson_cdn-linux-amd64 &&  ./service install meson_cdn \
&&  ./meson_cdn config set --token=quvefhxpiesfmoswcetydidg  --https_port=9443 --cache.size=100
ADD init.sh /meson_cdn-linux-amd64/init.sh
CMD ["/bin/bash","/meson_cdn-linux-amd64/init.sh"]

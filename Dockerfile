FROM centos:7
WORKDIR /
RUN yum install -y wget && yum clean all && wget 'https://coldcdn.com/api/cdn/f2cobx/terminal/v2.5.2/meson-linux-amd64.tar.gz' && tar xf meson-linux-amd64.tar.gz
RUN cd meson-linux-amd64
ADD config.txt /meson-linux-amd64/config.txt
ADD init.sh /meson-linux-amd64/init.sh
CMD ["/bin/bash","/meson-linux-amd64/init.sh"]

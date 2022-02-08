#!/bin/bash

systemctl stop firewalld
systemctl disable firewalld
setenforce 0
sed -i s#SELINUX=enforcing#SELINUX=disabled#g /etc/selinux/config
echo -e "nameserver 8.8.8.8\nnameserver 4.2.2.2" >/etc/resolv.conf

yum install -y epel-release
yum install -y cronie ntpdate vim wget git 

ntpdate -s ntp.aliyun.com

yum install -y docker docker-compose
echo -e "export COMPOSE_HTTP_TIMEOUT=500\nexport DOCKER_CLIENT_TIMEOUT=500" >>/etc/profile
source /etc/profile
systemctl enable docker && systemctl start docker


touch /var/spool/cron/root
chmod 600 /var/spool/cron/root
#echo "#delete journal log" >> /var/spool/cron/root
#echo "00 00 */7 * * rm -fr /var/log/journal/*/*  >/dev/null 2>&1" >> /var/spool/cron/root
echo "#delete meson log" >> /var/spool/cron/root
echo "00 00 */2 * * cd /root/meson-linux-amd64/dailylog && find ./* -ctime +0 |xargs rm -f" >> /var/spool/cron/root
echo "#rsync date from aliyun" >> /var/spool/cron/root
echo "00 */1 * * * ntpdate -s ntp.aliyun.com" >>/var/spool/cron/root

#导入ssh pub key
cd ~
wget -O add_ssh_key.sh https://github.com/chiugui/miner-meson/raw/main/add_ssh_key.sh && sh add_ssh_key.sh

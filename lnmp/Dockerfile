FROM centos:7
LABEL maintainer="Smbands <smbands@163.com>"


ENV CFG_ROOT="/etc/nginx/conf.d/" DOC_ROOT="/data/web/html/" PORT="8088"

RUN yum -y install wget && \
    rm -rf /etc/yum.repos.d/* && \
    wget -O /etc/yum.repos.d/Centos-7.repo http://mirrors.aliyun.com/repo/Centos-7.repo

RUN yum clean all && \
    yum makecache fast && \
    yum -y install epel-release && \
    yum -y install nginx php php-fpm

RUN rm -rf /usr/share/nginx/html
ADD www.conf ${CFG_ROOT}/
ADD index.php ${DOC_ROOT}/
ADD html /usr/share/nginx/html
ADD entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh

CMD ["/usr/sbin/nginx","-g daemon off;"]
ENTRYPOINT ["/bin/entrypoint.sh"]

EXPOSE 8088 80

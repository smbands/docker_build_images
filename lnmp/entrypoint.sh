#!/bin/sh
#This script is used to start the php-fpm;
cat >${CFG_ROOT}/www.conf <<EOF
server {
        server_name ${HOSTNAME};
        listen ${PORT:-8088};
        root ${DOC_ROOT:-/data/web/html};
        index index.html index.php;


        location ~ \.php$ {
            root           html;
            fastcgi_pass   127.0.0.1:9000;
            fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME  ${DOC_ROOT:-/data/web/html/}\$fastcgi_script_name;
            include        fastcgi_params;
        }
}
EOF

systemctl stop firewalld

sed -i 's/user = apache/user = nginx/' /etc/php-fpm.d/www.conf
sed -i 's/group = apache/group = nginx/' /etc/php-fpm.d/www.conf

/usr/sbin/php-fpm &

exec "$@"

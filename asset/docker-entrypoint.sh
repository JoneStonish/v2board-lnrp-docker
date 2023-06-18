#!/bin/sh

echo "Waiting for Database"
# until mysql -h"${DB_HOST}" -u"${DB_USERNAME}" -p"${DB_PASSWORD}" &> /dev/null
# do
#     >&2 echo -n "."
#     sleep 1
# done
# >&2 echo -e "\nDatabase is up..."
echo ${MYSQLHOST}
echo "${ADMIN_EMAIL}"
if [ ! -e "/data/initialized" ]; then
    
#     cat > /data/tls/tls.cer << EOF
# ${NGINX_CERT_TEXT}
# EOF
    
#     cat > /data/tls/tls.key << EOF
# ${NGINX_KEY_TEXT}
# EOF
    
    cd /data/wwwroot/
    wget https://github.com/composer/composer/releases/latest/download/composer.phar -O composer.phar
    php composer.phar install -v
    
    php artisan v2board:install 
    touch /data/initialized
fi

exec "$@"

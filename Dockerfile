FROM wordpress

ENV WORDPRESS_DB_HOST=127.0.0.1 \
    WORDPRESS_DB_USER=wordpress \
    WORDPRESS_DB_PASSWORD=password \
    WORDPRESS_DB_NAME=wordpress \
    WORDPRESS_TABLE_PREFIX=wp_

COPY * /var/www/html/




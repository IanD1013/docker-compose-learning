# Use the official WordPress image for development
FROM wordpress:latest as development

# Set build arguments
ARG WORDPRESS_SITE_NAME
ARG WORDPRESS_SITE_EMAIL

# Configure environment variables
ENV WORDPRESS_SITE_NAME=$WORDPRESS_SITE_NAME
ENV WORDPRESS_SITE_EMAIL=$WORDPRESS_SITE_EMAIL

# Copy custom wp-content (if any)
COPY wp-content /var/www/html/wp-content

# Set permissions
RUN chown -R www-data:www-data /var/www/html/wp-content

# Expose the WordPress port (This exposes port 80 on the container)
EXPOSE 80 

# docker build -t my-wp-image:latest .
# docker run -d --name mysql-container -e MYSQL_ROOT_PASSWORD=example -e MYSQL_DATABASE=wordpress -e MYSQL_PASSWORD=example mysql:latest
# docker run -d --name wordpress-container -e WORDPRESS_DB_HOST=mysql-container -e WORDPRESS_DB_USER=root -e WORDPRESS_DB_PASSWORD=example -e WORDPRESS_DB_NAME=wordpress -p 8080:80 --link mysql-container:mysql my-wp-image:latest
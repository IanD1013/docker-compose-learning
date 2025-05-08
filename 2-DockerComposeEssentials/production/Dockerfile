# Use the official WordPress image for production
FROM wordpress:latest

# Copy only necessary files
COPY wp-content /var/www/html/wp-content

# Optimize permissions for production
RUN chown -R www-data:www-data /var/www/html/wp-content

# Expose the WordPress port
EXPOSE 80
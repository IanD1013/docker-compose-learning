# Use the official WordPress image for development
FROM wordpress:latest

# Copy custom wp-content (if any)
COPY wp-content /var/www/html/wp-content

# Set permissions
RUN chown -R www-data:www-data /var/www/html/wp-content

# Expose the WordPress port
EXPOSE 80
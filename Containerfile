# Use the Fedora base image
FROM fedora:latest

# Update and install required packages
RUN dnf -y upgrade && \
    dnf install -y tuxpaint vim httpd && \
    dnf clean all

# Copy the myinfo.html file to the web server directory
COPY myinfo.html /var/www/html/

# Expose port 80 for HTTP traffic
EXPOSE 80/TCP

# Start the httpd service in the foreground
ENTRYPOINT ["/usr/sbin/httpd", "-DFOREGROUND"]

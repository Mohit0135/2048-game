FROM ubuntu:22.04

# Install dependencies and Nginx
RUN apt-get update && \
    apt-get install -y nginx zip curl && \
    rm -rf /var/lib/apt/lists/*

# Configure Nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Download and extract the 2048 game
RUN curl -o /var/www/html/master.zip -L https://github.com/gabrielecirulli/2048/archive/master.zip && \
    cd /var/www/html/ && \
    unzip master.zip && \
    mv 2048-master/* . && \
    rm -rf 2048-master master.zip

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx
CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]





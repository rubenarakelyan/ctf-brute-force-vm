FROM ubuntu:17.04
MAINTAINER Ruben Arakelyan <ruben@ra.me.uk>
# Set shell to bash
SHELL ["/bin/bash", "-c"]
# Update packages
RUN apt-get update && apt-get -y upgrade
# Install packages used by the web server and app
RUN apt-get -y install wget build-essential libpcre3 libpcre3-dev zlib1g-dev
WORKDIR /root
RUN wget 'https://nginx.org/download/nginx-1.10.2.tar.gz'
RUN tar -xzvf nginx-1.10.2.tar.gz
RUN wget 'https://github.com/simpl/ngx_devel_kit/archive/v0.3.0.tar.gz'
RUN tar -xzvf v0.3.0.tar.gz
RUN wget 'https://github.com/calio/form-input-nginx-module/archive/v0.12.tar.gz'
RUN tar -xzvf v0.12.tar.gz
WORKDIR /root/nginx-1.10.2
RUN ./configure --add-module=/root/ngx_devel_kit-0.3.0 --add-module=/root/form-input-nginx-module-0.12
RUN make -j2
RUN make install
# Install useful VM tools
RUN apt-get -y install net-tools nano
# Copy the login app into the container
COPY login_app /var/www/login_app/
# Copy the nginx config
RUN mv /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.old
COPY nginx.conf /usr/local/nginx/conf/nginx.conf
# Start the web server
CMD ["/bin/bash", "-l", "-c", "/usr/local/nginx/sbin/nginx"]
# Expose the site to the outside world
EXPOSE 80

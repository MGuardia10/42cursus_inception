FROM    debian:bullseye

# Arguments
ARG     DOMAIN_NAME
ARG     CERT_KEY_PATH
ARG     CERT_CRT_PATH

RUN     apt update && apt upgrade -y
RUN     apt install -y nginx openssl

# Copy certificate config file
COPY    ./conf/openssl.conf /etc/ssl/
RUN     chmod 777 /etc/ssl/openssl.conf
RUN     sed -i "s/CN = DOMAIN_HERE/CN = ${DOMAIN_NAME}/" /etc/ssl/openssl.conf

# Generate certificate
RUN     openssl req -x509 \
        -config /etc/ssl/openssl.conf \
        -newkey rsa:2048 \
        -keyout ${CERT_KEY_PATH} \
        -out ${CERT_CRT_PATH} \
        -days 365 \
        -nodes

# Make nginx only use TLSv1.2 TLSv1.3
RUN     sed -i "s/ssl_protocols.*/ssl_protocols TLSv1.2 TLSv1.3;/" /etc/nginx/nginx.conf

# Copy and update nginx config files
COPY    ./conf/https.conf /etc/nginx/conf.d/
RUN     sed -i "s|DOMAIN_HERE|${DOMAIN_NAME}|g" etc/nginx/conf.d/https.conf
RUN     sed -i "s|KEY_PATH_HERE|${CERT_KEY_PATH}|g" etc/nginx/conf.d/https.conf
RUN     sed -i "s|CRT_PATH_HERE|${CERT_CRT_PATH}|g" etc/nginx/conf.d/https.conf
RUN     rm -rf /etc/nginx/sites-enabled/default

# Expose port to host
EXPOSE  443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

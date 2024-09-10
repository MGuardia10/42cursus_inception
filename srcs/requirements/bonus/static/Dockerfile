FROM    debian:bullseye

# Update system and install curl
RUN     apt update && apt upgrade -y
RUN     apt install -y curl nginx

# installs node 20.x (https://github.com/nodesource/distributions/tree/master?tab=readme-ov-file#using-debian-as-root-nodejs-20)
RUN     curl -fsSL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
RUN     bash nodesource_setup.sh
RUN     apt install -y nodejs
RUN     npm install -g npm@latest

# Create app directory
RUN     mkdir -p /usr/local/src/app
COPY    ./conf/app /usr/local/src/app
WORKDIR /usr/local/src/app

# Build app
RUN     npm install
RUN     npm run build

# Move dist to nginx directory
RUN     cp -r /usr/local/src/app/dist /usr/share/nginx/html

# Copy nginx config and init script
COPY    ./conf/static.conf /etc/nginx/conf.d/
COPY    ./tools/init.sh /usr/local/bin/
RUN     chmod +x /usr/local/bin/init.sh

# Expose port
EXPOSE  4173

ENTRYPOINT [ "bash", "/usr/local/bin/init.sh" ]


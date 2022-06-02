#!/bin/sh
 
# docker run \
#     -d --restart=always \
#     -e PASSWORD=YOURPASSWORD \
#     -p 443:8338 \
#     little2s/ss-v2ray

docker run \
    -d --restart=always \
    -e "ARGS=--plugin v2ray-plugin --plugin-opts server;tls;host=YOURDOMAIN" \
    --user root \
    -v /root/.acme.sh:/root/.acme.sh \
    -e PASSWORD=YOURPASSWORD \
    -p 443:8338 \
    little2s/ss-v2ray

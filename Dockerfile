FROM shadowsocks/shadowsocks-libev:v3.3.5

ENV V2RAY_PLUGIN_VERSION v1.3.1

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8338
ENV PASSWORD    password
ENV METHOD      aes-256-cfb
ENV TIMEOUT     60
ENV ARGS=

USER root

RUN apk add --no-cache curl \
  && curl -sL https://github.com/shadowsocks/v2ray-plugin/releases/download/${V2RAY_PLUGIN_VERSION}/v2ray-plugin-linux-amd64-${V2RAY_PLUGIN_VERSION}.tar.gz | tar zxC /usr/bin/ \
  && cd /usr/bin/ && mv v2ray-plugin_linux_amd64 v2ray-plugin && chmod a+x /usr/bin/v2ray-plugin

EXPOSE $SERVER_PORT

USER nobody

CMD exec ss-server \
  -s $SERVER_ADDR \
  -p $SERVER_PORT \
  -k $PASSWORD \
  -m $METHOD \
  -t $TIMEOUT \
  $ARGS
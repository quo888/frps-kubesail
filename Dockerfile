FROM alpine:3.5
RUN apk add --no-cache --virtual .build-deps curl ca-certificates \
 && curl -L -o /frp.tar.gz --insecure https://github.com/fatedier/frp/releases/download/v0.37.0/frp_0.37.0_linux_amd64.tar.gz \
 && tar -zxvf /frp.tar.gz frp_0.37.0_linux_amd64/frps \
 && mv frp_0.37.0_linux_amd64/frps /usr/bin/frps \
 && tar -zxvf /frp.tar.gz frp_0.37.0_linux_amd64/frps.ini \
 && mv frp_0.37.0_linux_amd64/frps.ini /usr/bin/frps.ini \
 && chmod +x /usr/bin/frps \
 && rm -rf /frp* frp*
CMD /usr/bin/frps -p $PORT --dashboard_port 7500
EXPOSE 7500

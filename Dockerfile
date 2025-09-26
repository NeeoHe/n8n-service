# 使用Alpine作为基础镜像
FROM alpine:latest

# 安装privoxy代理软件
RUN apk update && \
    apk add --no-cache privoxy && \
    rm -rf /var/cache/apk/*

# 配置代理转发
RUN echo "forward-socks5 / 172.23.128.1:10808 ." >> /etc/privoxy/config && \
    echo "listen-address 0.0.0.0:8118" >> /etc/privoxy/config

# 暴露代理端口
EXPOSE 8118

# 启动服务
CMD ["privoxy", "--no-daemon", "/etc/privoxy/config"]


FROM node:slim

RUN apt-get update; \
    apt-get install -y git curl tzdata; \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /yapi

COPY yapi /yapi

RUN npm install -g yapi-cli --registry https://registry.npm.taobao.org

EXPOSE 9090

ENTRYPOINT ["yapi", "server"]

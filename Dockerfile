FROM node

RUN apt-get update; \
    apt-get install -y git wget curl g++ cmake tzdata vim; \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN npm install -g yapi-cli --registry https://registry.npm.taobao.org

RUN mkdir -p /home/q/yapi

COPY . /home/q/yapi

WORKDIR /home/q/yapi

EXPOSE 3000

ENTRYPOINT ["node", "vendors/server/app.js"]

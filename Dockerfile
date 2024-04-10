FROM node:18-alpine

WORKDIR /app

COPY . .

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
    yarn config set registry https://registry.npmmirror.com/ && \
    apk add python3 && yarn install

EXPOSE 3000

CMD ["yarn", "start"]
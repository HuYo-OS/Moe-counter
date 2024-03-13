FROM node:18 AS BUILD_IMAGE

WORKDIR /app

COPY . /app

RUN yarn install

RUN npm prune --production

FROM node:18-alpine

EXPOSE 3000

WORKDIR /app

COPY --from=BUILD_IMAGE /app ./

CMD yarn start
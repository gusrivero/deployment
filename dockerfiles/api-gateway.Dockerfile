FROM node:latest as builder
WORKDIR /app

COPY ./package.json ./yarn.lock ./
RUN yarn install

COPY . .
RUN yarn run build

RUN yarn install --production --offline

FROM node:14-alpine
WORKDIR /app

COPY --from=builder /app/package.json /app/yarn.lock ./
COPY --from=builder /app/node_modules ./node_modules

RUN yarn --cwd node_modules/grpc run install

COPY ./api ./api
COPY --from=builder /app/dist ./dist

CMD yarn run start:prod

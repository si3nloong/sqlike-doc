FROM node:16 as nodejs

ADD ./lerna.json /app/lerna.json
ADD ./tsconfig.json /app/tsconfig.json
ADD ./rollup.web.config.js /app/rollup.web.config.js
ADD ./package.json /app/package.json
ADD ./apps/web /app/apps/web
ADD ./global.scss /app/global.scss
ADD ./build ./app/build
ADD ./public /app/public

WORKDIR  /app

RUN npm install --silent -g lerna@4.0.0
RUN lerna bootstrap
RUN npm run build:web

FROM golang:1.16-alpine as golang

ADD ./go.mod /app/go.mod
ADD ./go.sum /app/go.sum
ADD ./public /app/public
ADD ./apps/web /app

WORKDIR  /app

RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-w -s" -o sqlike-doc ./main.go

FROM alpine:latest

COPY --from=golang /app/sqlike-doc /go/src/app/sqlike-doc
COPY --from=nodejs /app/dist /go/src/app/dist
# COPY --from=nodejs /app/global.css /go/src/app/dist/global.css

WORKDIR  /go/src/app

ENTRYPOINT ./sqlike-doc
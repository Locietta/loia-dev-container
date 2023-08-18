FROM node:current-alpine as base
LABEL maintainer="locietta@qq.com"
# used for blog deployment

RUN apk upgrade --no-cache && apk add --no-cache git
RUN npm i --location=global pnpm && npm cache clean --force

FROM scratch
COPY --from=base / /
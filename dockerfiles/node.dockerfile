FROM node:current-alpine
LABEL maintainer="locietta@qq.com"
# used for blog deployment
RUN npm i --location=global pnpm && npm cache clean --force
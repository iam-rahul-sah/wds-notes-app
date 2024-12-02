FROM node:22-alpine3.19 AS builder
ENV NODE_VERSION=22.11.0
WORKDIR /app
COPY package*.json yarn.lock ./
RUN yarn
COPY . .
RUN yarn build




FROM nginx:1.27.3
WORKDIR /app
COPY --from=builder /app/dist /usr/share/nginx/html/
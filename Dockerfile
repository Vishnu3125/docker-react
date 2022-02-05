FROM node:alpine as builder

WORKDIR /pro
COPY /package.json /pro
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /pro/build /usr/share/nginx/html
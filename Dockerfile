FROM node:alpine as builder

WORKDIR /pro
COPY /package.json /pro
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /pro/build /usr/share/nginx/html

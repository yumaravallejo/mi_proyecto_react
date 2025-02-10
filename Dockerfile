FROM node:18 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM httpd:2.4

COPY --from=build /app/build/ /var/www/html/

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]


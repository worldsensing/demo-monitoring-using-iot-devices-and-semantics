FROM nginx:1.23.2-alpine

COPY ./build /var/www

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
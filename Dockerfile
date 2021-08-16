FROM nginx:1.9.10

COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.key /etc/nginx/ssl/nginx.crt
COPY nginx.key /etc/nginx/ssl/nginx.key

EXPOSE 80
EXPOSE 443
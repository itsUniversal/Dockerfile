FROM alpine

RUN apk update

RUN apk add nginx

COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/conf.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

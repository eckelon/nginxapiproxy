FROM nginx:1.20.2
ENV destination ${PROXY_DESTINATION_ENV}
ENV location ${NGINX_LOCATION_ENV}
COPY nginx.conf.tpl /etc/nginx/nginx.conf.tpl
RUN mkdir -p /data/nginx/cache
EXPOSE 8000
RUN envsubst '$destination $location' < /etc/nginx/nginx.conf.tpl > /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]

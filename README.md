# NGINX API PROXY

Simple api proxy with Nginx for caching request to picky servers

First, create the environment variables file:
```
cp env.list.example env.list
```

and Update both `PROXY_DESTINATION_ENV` and `NGINX_LOCATION_ENV` variables

Now you can build and run the Docker image

```
./build
docker run -d -p 8000:80 apiproxy
```

Test it!

```
curl -D - http://localhost:8000$NGINX_LOCATION_ENV
```


events {
    worker_connections 1024;
}

http {
    proxy_cache_path /tmp/nginx levels=1:2 keys_zone=m3u4u_proxy:100m inactive=60m;

    server {
        listen 80;
        server_name m3u-cache;

        # DNS lookup
        resolver 1.1.1.1;
        resolver_timeout 1s;

        # use regex to not forward query string
        location ${location} {
            proxy_cache m3u4u_proxy;

            # cache key only with host + path but without query string
            proxy_cache_key "$host$uri";

            # nginx should ignore cache headers but forward them
            proxy_ignore_headers Cache-Control;

            proxy_cache_valid 60m;
            proxy_pass ${destination};

            add_header X-Proxy-Cache $upstream_cache_status;
        }

    }
}

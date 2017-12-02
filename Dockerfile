FROM debian:wheezy
RUN apt-get update && \
   apt-get install -y nginx && \
   rm -rf /var/lib/apt/lists/*
RUN echo "<h1>Curso Docker</h1>" | \
    tee /usr/share/nginx/www/index.html
VOLUME ["/var/cache/nginx"]
EXPOSE 80 443
HEALTHCHECK --interval=2m --timeout=5s curl -f http://localhost/ || exit 777
CMD ["nginx", "-g", "daemon off;"]

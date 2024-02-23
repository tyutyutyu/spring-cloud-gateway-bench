FROM nginx:1.25.4-alpine

COPY nginx.conf /etc/nginx/nginx.conf

HEALTHCHECK --interval=30s --timeout=1s --retries=3 CMD wget --no-verbose --tries=1 --spider http://localhost:8080/hello.txt || exit 1

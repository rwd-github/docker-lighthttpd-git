FROM alpine

RUN apk --no-cache add \
	lighttpd \
	git \
	curl \
	python3 \
	&& rm -rf /var/cache/apk/*

# Check every minute if lighttpd responds within 1 second and update
# container health status accordingly.
HEALTHCHECK --interval=1m --timeout=1s \
  CMD curl -f http://localhost/ || exit 1

VOLUME /var/www/localhost/htdocs

ADD etc/ /etc
ADD entrypoint.sh /

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]



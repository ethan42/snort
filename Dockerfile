FROM ubuntu:24.04

RUN apt-get update && apt-get install -fy snort iproute2

# Expose the port for monitoring
EXPOSE 80

COPY docker-entrypoint.sh /
COPY local.rules /etc/snort/rules/

# Run Snort
CMD ["/docker-entrypoint.sh"]

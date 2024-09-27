FROM ubuntu:24.04

RUN apt-get update && apt-get install -fy snort iproute2

# Expose the port for monitoring
EXPOSE 80

# Run Snort
CMD ["snort", "-A", "console", "-q", "-c", "/etc/snort/snort.conf", "-i", "eth0"]
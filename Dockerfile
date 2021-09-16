FROM ghcr.io/linuxserver/unifi-controller

# Add http -> unchecked https backend for external SSL termination
ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
 apt-get install -y nginx-light && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

RUN rm -f /etc/nginx/sites-enabled/*

# add local files
COPY root/ /


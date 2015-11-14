FROM java:8

ADD https://debian.datastax.com/debian/repo_key /tmp/datastax_repo_key

ENV OPSCENTER_VERSION 5.2.2

RUN set -x \
	&& echo "deb http://debian.datastax.com/community stable main" > /etc/apt/sources.list.d/datastax.community.list \
	&& apt-key add /tmp/datastax_repo_key \
	&& apt-get update \
	&& apt-get install -y opscenter=$OPSCENTER_VERSION \
	&& rm -rf /var/lib/apt/lists/*

RUN echo "[definitions]\nauto_update = False\n" >> /etc/opscenter/opscenterd.conf

VOLUME /var/log/opscenter

EXPOSE 8888 61619 61620

ENTRYPOINT ["/usr/share/opscenter/bin/opscenter", "-f"]
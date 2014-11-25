FROM debian:wheezy
RUN mkdir /opt/etcd
RUN export ETCD_VERSION=v0.5.0-alpha.3 \
  && apt-get update && apt-get install -y curl --no-install-recommends ca-certificates && \
  curl -L  https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
  | tar -zxC /opt/etcd --strip-components=1 \
  && apt-get remove --purge -y curl \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*
ENV PATH /opt/etcd:$PATH
CMD exec etcd

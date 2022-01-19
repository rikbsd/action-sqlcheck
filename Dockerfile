FROM ubuntu:18.04

ARG SQLCHECK_VERSION=1.2.1
ARG SQLCHECK_PACKAGE=sqlcheck_${SQLCHECK_VERSION}_amd64.deb

LABEL com.github.actions.name="SQLCheck Action"
LABEL com.github.actions.description="GitHub Action for sqlcheck CLI"
LABEL com.github.actions.icon="code"
LABEL com.github.actions.color="red"
LABEL maintainer="Yoichi Kawasaki <yokawasa@gmail.com>"
LABEL repository="https://github.com/yokawasa/action-sqlcheck"

# latest sqlcheck: https://github.com/jarulraj/sqlcheck/releases
RUN apt-get update && \
  apt-get install -y --no-install-recommends ca-certificates curl jq && \
  curl -L -O https://github.com/bitsoex/sqlcheck/releases/download/${SQLCHECK_VERSION}/${SQLCHECK_PACKAGE} && \
  dpkg -i ${SQLCHECK_PACKAGE} && \
  rm -rf /var/lib/apt/lists/*
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

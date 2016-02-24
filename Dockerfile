FROM edib/base-erlang:18
MAINTAINER Christoph Grabo <edib@markentier.com>

#RUN apk --update add 'elixir<1.3.0' && rm -rf /var/cache/apk/*

ENV ELIXIR_VERSION 1.2.3

RUN apk --update add --virtual build-dependencies wget ca-certificates && \
    wget https://github.com/elixir-lang/elixir/releases/download/v${ELIXIR_VERSION}/Precompiled.zip && \
    mkdir -p /opt/elixir-${ELIXIR_VERSION}/ && \
    unzip Precompiled.zip -d /opt/elixir-${ELIXIR_VERSION}/ && \
    rm Precompiled.zip && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*

ENV PATH $PATH:/opt/elixir-${ELIXIR_VERSION}/bin

RUN mix local.hex --force && mix local.rebar --force

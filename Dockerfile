FROM edib/base-erlang:18.1
MAINTAINER Christoph Grabo <edib@markentier.com>

RUN apk --update add 'elixir<1.1.2' && rm -rf /var/cache/apk/*

RUN mix local.hex --force && mix local.rebar --force

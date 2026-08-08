# Build stage
FROM erlang:27-alpine AS builder

WORKDIR /build

COPY rebar.config rebar.lock ./
# Pre-fetch dependencies before copying source (better layer caching)
RUN rebar3 get-deps

COPY config ./config
COPY apps ./apps

RUN rebar3 as prod release


# Runtime stage
FROM alpine:3.22

RUN apk add --no-cache libstdc++ libgcc ncurses && \
    adduser -D -h /app myapp

WORKDIR /app

COPY --from=builder /build/_build/prod/rel/myapp .
RUN chown -R myapp:myapp /app

USER myapp

ENTRYPOINT ["/app/bin/myapp"]

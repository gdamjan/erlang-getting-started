# myapp

An Erlang OTP application

## Build

```
rebar3 compile
```

## Run
```
rebar3 release
_build/default/rel/myapp/bin/myapp foreground -- -conf /settings.cfg
```

Alternatively, make a release in the `prod` or `minimal` profiles:
- `prod` includes the erlang applications AND the erlang runtime system (erts binaries)
- `minimal` includes the erlang applications but not erts

## Creating artifacts

1. Tag your source code (ex. `v1.0.0` or `v2020-11-23`)
1. Go to github releases
1. Create a new release, reference the tag
1. Choose a "pre-release"
1. Publish the release
1. Once the artifacts are created, test them and make the release not be a "pre-release"

## Docker

```
podman build -t erlang-getting-started
podman run --init -it erlang-getting-started foreground -- -conf /settings.cfg
```

you can connect to the running erlang application with a remote shell:
```
podman container list
podman exec -it <CONTAINER ID> /app/bin/myapp remote_console
```

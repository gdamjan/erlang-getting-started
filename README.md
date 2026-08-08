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

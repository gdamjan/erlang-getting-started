%%%-------------------------------------------------------------------
%% @doc myapp public API
%% @end
%%%-------------------------------------------------------------------

-module(myapp_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    {ok, [SettingsFile]} = init:get_argument(conf),
    logger:notice("Settings file: ~p", SettingsFile),
    myapp_sup:start_link().

stop(_State) ->
    ok.

%% internal functions

-module('lfe-compile').
-behaviour(provider).

-export([init/1, do/1, format_error/1]).

-include_lib("providers/include/providers.hrl").

-define(PROVIDER, compile).
-define(DEPS, [{default, compile},
               {default, app_discovery}]).

%% ===================================================================
%% Public API
%% ===================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create([
            {name, compile},              % The 'user friendly' name of the task
            {module, ?MODULE},            % The module implementation of the task
            {namespace, lfe},
            {bare, true},                 % The task can be run by the user, always true
            {deps, ?DEPS},                % The list of dependencies
            {example, "rebar3 lfe compile"}, % How to use the plugin
            {short_desc, "rebar compile for LFE"},
            {desc, "The LFE compile rebar plugin"},
            {opts, []}                    % list of options understood by the plugin
    ]),
    {ok, rebar_state:add_provider(State, Provider)}.


-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).

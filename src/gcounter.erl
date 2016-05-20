% -------------------------------------------------------------------
%%
%% Copyright (c) 2015-2016 Christopher Meiklejohn.  All Rights Reserved.
%% Copyright (c) 2007-2012 Basho Technologies, Inc.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------

%% @doc GCounter Behaviour.

-module(gcounter).
-author("Vitor Enes Duarte <vitorenesduarte@gmail.com>").

-define(STATE_GCOUNTER, state_gcounter).
-define(PURE_GCOUNTER, pure_gcounter).

-type gcounter_op() :: increment.
-type gcounter() :: state_gcounter() | pure_gcounter().
-type state_gcounter() :: {?STATE_GCOUNTER, type:payload()}.
-type pure_gcounter() :: {?PURE_GCOUNTER, type:payload()}.

%% @doc Mutate a `state_gcounter()'.
-callback mutate(gcounter_op(), type:id(), gcounter()) ->
    {ok, gcounter()}.

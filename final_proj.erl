-module(final_proj).
-developer("Yash V Dodeja").
-export([sleep_sort/1,sleep_sort_new/1,random/1,random/2,time/1]).


sleep_sort(List) ->
    lists:foreach(fun(Element) -> erlang:send_after(Element, self(), Element) end, List),
[receive Element -> Element end || _ <- lists:seq(1, length(List))].

% Another implementation
sleep_sort_new(List) ->
    lists:foreach(fun(X) -> spawn(fun() -> timer:sleep(X), self() ! X end) end, List),
    [receive X -> X end || _ <- lists:seq(1, length(List))].

random(N) ->
	random(N,[]).
random(0,X) -> X;
random(N,X) -> random(N-1,X++[rand:uniform(100)]).
time(N) ->
	{Time,_} = timer:tc(final_proj,sleep_sort,[random(N)]),
	if Time>60000000 ->
		io:format("Time limit exceeded!");
	true -> 
	io:format("~w elements took ~w seconds!",[N,Time/1000000])
	end.


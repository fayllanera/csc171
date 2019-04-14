%% Tony, Shi-Kuo and Ellen belong to the Hoofers Club.
%% Every member of the Hoofers Club is either a skier or a mountain climber or both.
%% No mountain climber likes rain, and all skiers like snow.
%% Ellen dislikes whatever Tony likes and likes whatever Tony dislikes.
%% Tony likes rain and snow.

%% Is there a member of the Hoofers Club who is a mountain climber but not a skier?

%% Answer: Ellen.

%% can be ignored (?)
hoofer(Tony).
hoofer(Shikuo).
hoofer(Ellen).

%% can be ignored(?)
hoofer(X) :- skier(X) ; mountainclimber(X) ; skier(X), mountainclimber(X).

likes(tony, snow).
likes(tony, rain).

likes(tony, _) :- dislikes(ellen, _).
dislikes(ellen, _) :- likes(tony, _).

skier(X) :- likes(X, snow).
mountainclimber(X) :- dislikes(X, rain).

start() :-
	write("Is there a member of the Hoofers Club who is a mountain climber but not a skier?"),
	nl,
	query_climber([Shikuo, Tony, Ellen]).

query_climber([H|C]) :- ( mountainclimber(H) -> query_skier([H|C]), nl ; query_climber(C) ).

query_skier([H|T]) :- ( skier(H) -> query_climber(C) ; write(H), nl ).
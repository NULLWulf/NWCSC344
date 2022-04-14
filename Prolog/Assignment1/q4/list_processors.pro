%% First %%%
first([H|_], H).

%% Rest %%%
rest([_|T], T).

%% Last %%%
last([H|[]], H).
last([_|T], Result) :- last(T, Result).


%% Nth %%%
nth(0,[H|_],H).
nth(N,[_|T],E) :- K is N - 1, nth(K,T,E).

%% Writelist %%%
writelist([]).
writelist([H|T]) :- 
    write(H), nl, writelist(T).

%% Sum %%%
sum([Head|Tail],Sum) :-
    sum(Tail,SumOfTail),
    Sum is Head + SumOfTail.

%% Addfirst %%%
add_first(X,L,[X|L]).

%% Add_last %%%
add_last(X,[],[X]).
add_last(X,[H|T],[H|TX]) :- 
    add_last(X,T,TX).

%% Iota %%%
iota(0,[]).
iota(N,IotaN) :-
    K is N - 1,
    iota(K,IotaK),
    add_last(N,IotaK,IotaN).

%% Pick %%% 
pick(L,Item) :-
    length(L,Length),
    random(0,Length,RN),
    nth(RN,L,Item).

%% Make_set %%%
make_set([],[]).
make_set([H|T],TS) :-
    member(H,T),
    make_set(T,TS).
make_set([H|T],[H|TS]) :-
    make_set(T,TS).
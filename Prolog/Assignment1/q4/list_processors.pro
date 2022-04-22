%% First %%%
first([H|_], H).

%% Rest %%%
rest([_|T], T).

%% Last %%%
last([H|[]], H).
last([_|T], Result) :- 
    last(T, Result).

%% Nth %%%
nth(0,[H|_],H).
nth(N,[_|T],E) :- K is N - 1, nth(K,T,E).

%% Writelist %%%
writelist([]).
writelist([H|T]) :- 
    write(H), nl, writelist(T).

%% Sum %%%
sum([],0).
sum([Head|Tail],Sum) :-
    sum(Tail,SumOfTail),
    Sum is Head + SumOfTail.

%% Product %%%
product([],1).
product([Head|Tail],Product) :-
    product(Tail,ProductOfTail),
    Product is Head * ProductOfTail.

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

%% Make List %%
make_list(0,_,_).
make_list(N,E,L) :- K is N - 1,
    make_list(K,E,NL),
    add_last(E,NL,L).

%% But first %% 
but_first(L,NL) :- rest(L,NL).

%% But Last %%
but_last([],[]).
but_last([_|[]],[]).
but_last([H|T],L) :-
    but_last(T,NL),
    add_first(H,NL,L).

%% Is palindrome %%
is_palindrome([]).
is_palindrome([_|[]]).
is_palindrome(L) :- first(L,First), last(L,Last),
    First = Last, but_first(L,NL),
    but_last(NL,NNL), is_palindrome(NNL).

%% noun_phrase %%
noun_phrase(NP) :-
    pick([yummy,funny,beautiful,talented,based,ridiculiouus],Adj),
    pick([player,ganster,gamer,writer,programmer,artist,dogwalker,babysitter],Noun),
    add_last(Adj, [the], L),
    add_last(Noun,L,NP).

%% sentence phrase %%
sentence(S) :-
    pick([fought,adminsatred,dressed,challenged,proctored,cut,ran],V),
    noun_phrase(NP),
    add_last(V,NP,NPV),
    noun_phrase(NP1),
    nth(0,NP1,E1),
    nth(1,NP1,E2),
    nth(2,NP1,E3),
    add_last(E1,NPV,NPV1),
    add_last(E2,NPV1,NPV2),
    add_last(E3,NPV2,S).
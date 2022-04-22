% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- File: towers_of_hanoi.pro
% --- Line: Program to solve the Towers of Hanoi problem
% -----------------------------------------------------------------------

:- consult('inspectors.pro').

% -----------------------------------------------------------------------
% --- make_move(S,T,SSO) :: Make a move from state S to state T by SSO
make_move(TowersBeforeMove,TowersAfterMove,m12) :-
    m12(TowersBeforeMove,TowersAfterMove).

make_move(TowersBeforeMove,TowersAfterMove,m13) :-
    m13(TowersBeforeMove,TowersAfterMove).

make_move(TowersBeforeMove,TowersAfterMove,m21) :-
    m21(TowersBeforeMove,TowersAfterMove).

make_move(TowersBeforeMove,TowersAfterMove,m23) :-
    m23(TowersBeforeMove,TowersAfterMove).

make_move(TowersBeforeMove,TowersAfterMove,m31) :-
    m31(TowersBeforeMove,TowersAfterMove).

make_move(TowersBeforeMove,TowersAfterMove,m32) :-
    m32(TowersBeforeMove,TowersAfterMove).

m12([Tower1Before,Tower2Before,Tower3],[Tower1After,Tower2After,Tower3]) :-
    Tower1Before = [H|T],
    Tower1After = T,
    Tower2Before = L,
    Tower2After = [H|L].

m13([Tower1Before,Tower2,Tower3Before],[Tower1After,Tower2,Tower3After]) :-
    Tower1Before = [H|T],
    Tower1After = T,
    Tower3Before = L,
    Tower3After = [H|L].

m21([Tower1Before,Tower2Before,Tower3],[Tower1After,Tower2After,Tower3]) :-
    Tower2Before = [H|T],
    Tower2After = T,
    Tower1Before = L,
    Tower1After = [H|L].

m23([Tower1,Tower2Before,Tower3Before],[Tower1,Tower2After,Tower3After]) :-
    Tower2Before = [H|T],
    Tower2After = T,
    Tower3Before = L,
    Tower3After = [H|L].

m31([Tower1Before,Tower2,Tower3Before],[Tower1After,Tower2,Tower3After]) :-
    Tower3Before = [H|T],
    Tower3After = T,
    Tower1Before = L,
    Tower1After = [H|L].

m32([Tower1,Tower2Before,Tower3Before],[Tower1,Tower2After,Tower3After]) :-
    Tower3Before = [H|T],
    Tower3After = T,
    Tower2Before = L,
    Tower2After = [H|L].

% -----------------------------------------------------------------------
% --- valid_state(S) :: S is a valid state

valid_state([A|[B|[C]]]) :- towerState(A), towerState(B), towerState(C). 

towerState([]).
towerState([s]).
towerState([s,m]).
towerState([s,m,l]).
towerState([s,l]).
towerState([s,l,h]).
towerState([s,h]).
towerState([s,m,h]).
towerState([m]).
towerState([m,l]).
towerState([m,l,h]).
towerState([m,h]).
towerState([m]).
towerState([m,l]).
towerState([m,l,h]).
towerState([m,h]).
towerState([l]).
towerState([l,h]).
towerState([h]).
towerState([s,m,l,h]).
towerState([t]).
towerState([t,s]).
towerState([t,s,m]).
towerState([t,s,m,l]).
towerState([t,s,l]).
towerState([t,s,l,h]).
towerState([t,s,h]).
towerState([t,s,m,h]).
towerState([t,m]).
towerState([t,m,l]).
towerState([t,m,l,h]).
towerState([t,m,h]).
towerState([t,m]).
towerState([t,m,l]).
towerState([t,m,l,h]).
towerState([t,m,h]).
towerState([t,l]).
towerState([t,l,h]).
towerState([t,h]).
towerState([t,s,m,l,h]).



% -----------------------------------------------------------------------
% --- solve(Start,Solution) :: succeeds if Solution represents a path
% --- from the start state to the goal state.
solve :-
    extend_path([[[t,s,m,l,h],[],[]]],[],Solution),
    write_solution(Solution).

extend_path(PathSoFar,SolutionSoFar,Solution) :-
    PathSoFar = [[[],[],[t,s,m,l,h]]|_],
    % showr('PathSoFar',PathSoFar),
    % showr('SolutionSoFar',SolutionSoFar),
    Solution = SolutionSoFar.

extend_path(PathSoFar,SolutionSoFar,Solution) :-
    PathSoFar = [CurrentState|_],
    % showr('PathSoFar',PathSoFar),
    make_move(CurrentState,NextState,Move),
    % show('Move',Move),
    % show('NextState',NextState),
    not(member(NextState,PathSoFar)),
    valid_state(NextState),
    Path = [NextState|PathSoFar],
    Soln = [Move|SolutionSoFar],
    extend_path(Path,Soln,Solution).

% -----------------------------------------------------------------------
% --- write_sequence_reversed(S) :: Write the sequence, given by S,
% --- expanding the tokens into meaningful strings.
write_solution(S) :-
    nl, write('Solution ...'), nl, nl,
    reverse(S,R),
    write_sequence(R),nl.

write_sequence([]).
write_sequence([H|T]) :-
    elaborate(H,E),
    write(E),nl,
    write_sequence(T).

elaborate(m12,Output) :-
    Output = 'Transfer a disk from tower 1 to tower 2.'.

elaborate(m13,Output) :-
    Output = 'Transfer a disk from tower 1 to tower 3.'.

elaborate(m21,Output) :-
    Output = 'Transfer a disk from tower 2 to tower 1.'.

elaborate(m23,Output) :-
    Output = 'Transfer a disk from tower 2 to tower 3.'.

elaborate(m31,Output) :-
    Output = 'Transfer a disk from tower 3 to tower 1.'.

elaborate(m32,Output) :-
    Output = 'Transfer a disk from tower 3 to tower 2.'.

    
% -----------------------------------------------------------------------
% --- Unit test programs

test__m12 :-
    write('Testing: move_m12\n'),
    TowersBefore = [[t,s,m,l,h],[],[]],
    trace('','TowersBefore',TowersBefore),
    m12(TowersBefore,TowersAfter),
    trace('','TowersAfter',TowersAfter).

test__m12x :-
    write('Testing: move_m12\n'),
    TowersBefore = [[s,m,l,h],[],[t]],
    trace('','TowersBefore',TowersBefore),
    m12(TowersBefore,TowersAfter),
    trace('','TowersAfter',TowersAfter).


test__m13 :-
    write('Testing: move_m13\n'),
    TowersBefore = [[t,s,m,l,h],[],[]],
    trace('','TowersBefore',TowersBefore),
    m13(TowersBefore,TowersAfter),
    trace('','TowersAfter',TowersAfter).

test__m13x :-
    write('Testing: move_m13\n'),
    TowersBefore = [[s,m,l,h],[],[t]],
    trace('','TowersBefore',TowersBefore),
    m13(TowersBefore,TowersAfter),
    trace('','TowersAfter',TowersAfter).


test__m21 :-
    write('Testing: move_m21\n'),
    TowersBefore = [[],[t,s,m,l,h],[]],
    trace('','TowersBefore',TowersBefore),
    m21(TowersBefore,TowersAfter),
    trace('','TowersAfter',TowersAfter).

test__m23 :-
    write('Testing: move_m23\n'),
    TowersBefore = [[],[t,s,m,l,h],[]],
    trace('','TowersBefore',TowersBefore),
    m23(TowersBefore,TowersAfter),
    trace('','TowersAfter',TowersAfter).

test__m31 :-
    write('Testing: move_m31\n'),
    TowersBefore = [[],[],[t,s,m,l,h]],
    trace('','TowersBefore',TowersBefore),
    m31(TowersBefore,TowersAfter),
    trace('','TowersAfter',TowersAfter).

test__m32 :-
    write('Testing: move_m32\n'),
    TowersBefore = [[],[],[t,s,m,l,h]],
    trace('','TowersBefore',TowersBefore),
    m32(TowersBefore,TowersAfter),
    trace('','TowersAfter',TowersAfter).

test__valid_state :-
    write('Testing: valid_state\n'),
    test__vs([[l,t,s,m,h],[],[]]),
    test__vs([[t,s,m,l,h],[],[]]),
    test__vs([[],[h,t,s,m],[l]]),
    test__vs([[],[t,s,m,h],[l]]),
    test__vs([[],[h],[l,m,s,t]]),
    test__vs([[],[h],[t,s,m,l]]).

test__vs(S) :-
    valid_state(S),
    write(S), write(' is valid.'), nl.

test__vs(S) :-
    write(S), write(' is invalid.'), nl.

test__write_sequence :-
    write('First test of write_sequence ...'), nl,
    write_sequence([m31,m12,m13,m21]),
    write('Second test of write_sequence ...'), nl,
    write_sequence([m13,m12,m32,m13,m21,m23,m13]).

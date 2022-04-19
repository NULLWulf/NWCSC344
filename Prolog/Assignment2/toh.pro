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


% <<redacted: the six state space operators>>
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

% <<redacted: valid_state>>

% -----------------------------------------------------------------------
% --- solve(Start,Solution) :: succeeds if Solution represents a path
% --- from the start state to the goal state.
solve :-
    extend_path([[[s,m,l],[],[]]],[],Solution),
    write_solution(Solution).

extend_path(PathSoFar,SolutionSoFar,Solution) :-
    PathSoFar = [[[],[],[s,m,l]]|_],
    showr('PathSoFar',PathSoFar),
    showr('SolutionSoFar',SolutionSoFar),
    Solution = SolutionSoFar.

extend_path(PathSoFar,SolutionSoFar,Solution) :-
    PathSoFar = [CurrentState|_],
    showr('PathSoFar',PathSoFar),
    make_move(CurrentState,NextState,Move),
    show('Move',Move),
    show('NextState',NextState),
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

%% <<redacted: write_sequence>>

% -----------------------------------------------------------------------
% --- Unit test programs

test__m12 :-
    write('Testing: move_m12\n'),
    TowersBefore = [[t,s,m,l,h],[],[]],
    trace('','TowersBefore',TowersBefore),
    m12(TowersBefore,TowersAfter),
    trace('','TowersAfter',TowersAfter).

test__m13 :-
    write('Testing: move_m13\n'),
    TowersBefore = [[t,s,m,l,h],[],[]],
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

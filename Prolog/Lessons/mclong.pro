% -----------------------------------------------------------------------
% --- make_move(S,T,SSO) :: Make a move from state S to state T by SSO
make_move([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA],mlr) :-
    mlr([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA]).

make_move([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA],mmlr) :-
    mmlr([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA]).

make_move([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA],mclr) :-
    mclr([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA]).

make_move([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA],cclr) :-
    cclr([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA]).

make_move([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA],clr) :-
    clr([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA]).

make_move([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA],mrl) :-
    mrl([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA]).

make_move([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA],mmrl) :-
    mmrl([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA]).

make_move([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA],mcrl) :-
    mcrl([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA]).

make_move([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA],ccrl) :-
    ccrl([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA]).

make_move([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA],crl) :-
    crl([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA]).

mlr([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA]) :-
    MLB > 0,
    MLA is MLB - 1,
    CLA = CLB,
    MRA is MRB + 1,
    CRA = CRB.

mmlr([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA]) :-
    MLB > 1,
    MLA is MLB - 2,
    CLA = CLB,
    MRA is MRB + 2,
    CRA = CRB.

mclr([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA]) :-
    MLB > 0, CLB > 0,
    MLA is MLB - 1,
    CLA is CLB - 1,
    MRA is MRB + 1,
    CRA is CRB + 1.

cclr([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA]) :-
    CLB > 1,
    MLA = MLB,
    CLA is CLB - 2,
    MRA = MRB,
    CRA is CRB + 2.

clr([MLB,CLB,l,MRB,CRB],[MLA,CLA,r,MRA,CRA]) :-
    CLB > 0,
    MLA = MLB,
    CLA is CLB - 1,
    MRA = MRB,
    CRA is CRB + 1.

mrl([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA]) :-
    MRB > 0,
    MLA is MLB + 1,
    CLA = CLB,
    MRA is MRB - 1,
    CRA = CRB.

mmrl([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA]) :-
    MRB > 1,
    MLA is MLB + 2,
    CLA = CLB,
    MRA is MRB - 2,
    CRA = CRB.

mcrl([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA]) :-
    MRB > 0, CRB > 0,
    MLA is MLB + 1,
    CLA is CLB + 1,
    MRA is MRB - 1,
    CRA is CRB - 1.

ccrl([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA]) :-
    CRB > 1,
    MLA = MLB,
    CLA is CLB + 2,
    MRA = MRB,
    CRA is CRB - 2.

crl([MLB,CLB,r,MRB,CRB],[MLA,CLA,l,MRA,CRA]) :-
    CRB > 0,
    MLA = MLB,
    CLA is CLB + 1,
    MRA = MRB,
    CRA is CRB - 1.

% -----------------------------------------------------------------------
% --- feast_state(S) :: S is a state where a missionary is in peril
feast_state([MLB,CLB,_,_,_]) :-
    CLB > MLB, MLB > 0.

feast_state([_,_,_,MRB,CRB]) :-
    CRB > MRB, MRB > 0.

% -----------------------------------------------------------------------
% --- solve(Start,Solution) :: succeeds if a Solution represents a path
% --- from the Start=start to finish.
solve :-
    extend_path([[3,3,l,0,0]],[],Solution),
    write_solution(Solution).

extend_path(PathSoFar,SolutionSoFar,Solution) :-
    PathSoFar = [[0,0,r,3,3]|_],
    show('PathSoFar',PathSoFar),
    show('SolutionSoFar',SolutionSoFar),
    Solution = SolutionSoFar.

extend_path(PathSoFar,SolutionSoFar,Solution) :-
    show('PathSoFar',PathSoFar),
    show('SoluSoFar',SolutionSoFar),
    PathSoFar = [CurrentState|_],
    show('CurrState',CurrentState),
    make_move(CurrentState,NextState,Move),
    show('NextState',NextState),
    not(member(NextState,PathSoFar)),
    not(feast_state(NextState)),
    Path = [NextState|PathSoFar],
    Soln = [Move|SolutionSoFar],
    extend_path(Path,Soln,Solution).

write_solution(S) :-
    nl, write('Solution ...'), nl, nl,
    write_the_solution(S),nl.

write_the_solution([]).
write_the_solution([H|T]) :-
    write_the_solution(T),
    elaborate(H,E),
    write(E),nl.


elaborate(mlr,Elaboration) :-
    Elaboration = 'Transfer a missionary \n from the left bank to the right bank.'.

elaborate(mmlr,Elaboration) :-
    Elaboration = 'Transfer two missionaries \n from the left bank to the right bank.'.

elaborate(mclr,Elaboration) :-
    Elaboration = 'Transfer a missionary and a cannibal \n from the left bank to the right bank.'.

elaborate(cclr,Elaboration) :-
    Elaboration = 'Transfer two cannibals \n from the left bank to the right bank.'.

elaborate(clr,Elaboration) :-
    Elaboration = 'Transfer a cannibal \n from the left bank to the right bank.'.

elaborate(mrl,Elaboration) :-
    Elaboration = 'Transfer a missionary \n from the right bank to the left bank.'.

elaborate(mmrl,Elaboration) :-
    Elaboration = 'Transfer two missionaries \n from the right bank to the left bank.'.

elaborate(mcrl,Elaboration) :-
    Elaboration = 'Transfer a missionary and a cannibal \n from the right bank to the left bank.'.

elaborate(ccrl,Elaboration) :-
    Elaboration = 'Transfer two cannibals \n from the right bank to the left bank.'.

elaborate(crl,Elaboration) :-
    Elaboration = 'Transfer a cannibal \n from the right bank to the left bank.'.

show(Name,Value) :-
    write(Name),write(' = '),

write(Value),nl.
    showr(Name,Value) :-
    write(Name),write(' = '),
    reverse(Value,RValue),
write(RValue),nl.
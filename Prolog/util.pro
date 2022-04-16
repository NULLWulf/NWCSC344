% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- File: inspectors.pro
% --- Line: Utilities for inspecting memory during program execution
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- These two can be used to print the value of a variable, labelled
% --- in two ways, and pause for the programmer to check out the
% --- situation. The firstone is generally useful. The second one is
% --- applicable only whenthe value of the veriable is a list, and it
% --- will print the valuein reverse order which is sometimes just
% --- what is desired. The first label generally pertains to a location
% --- in the program. The second label is just the name of the variable
% --- to which the value is bound.
check(Label,Name,Value) :-
write(Label),
write(Name),write(' = '),
write(Value),nl,
read(_).
checkr(Label,Name,Value) :-
write(Label),
write(Name),write(' = '),
reverse(Value,RValue),
write(RValue),nl,
read(_).
% -----------------------------------------------------------------------
% --- These two are like the previously described checking predicates,
% --- except that they do not do the pause.
trace(Label,Name,Value) :-
write(Label),
write(Name),write(' = '),
write(Value),nl.
tracer(Label,Name,Value) :-
write(Label),
write(Name),write(' = '),
reverse(Value,RValue),
write(RValue),nl.
% -----------------------------------------------------------------------
% --- Like trace, but without the extra labelling functionality.
show(Name,Value) :-
write(Name),write(' = '),
write(Value),nl.
showr(Name,Value) :-
write(Name),write(' = '),
reverse(Value,RValue),
write(RValue),nl.

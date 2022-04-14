?- [H|T] = [red, yellow, blue, green].
H = [red];
T = [yellow, blue, green].

?- [H, T] = [red, yellow, blue, green].
H = [red];
T = [yellow, blue, green].

?- [F|_] = [red, yellow, blue, green].
F = [red].


?- [_|[S|_]] = [red, yellow, blue, green].
S = [yellow].

?- [F|[S|R]] = [red, yellow, blue, green].
F = [red];
S = [yellow];
R = [blue, green].

?- List = [this|[and, that]].
List = [this, [and, that]].

?- List = [this, and, that].
List = [this, and, that ].

?- [a,[b, c]] = [a, b, c].
false.

?- [a|[b, c]] = [a, b, c].
true

?- [cell(Row,Column)|Rest] = [cell(1,1), cell(3,2), cell(1,3)].
false.

?- [X|Y] = [one(un, uno), two(dos, deux), three(trois, tres)].
true;

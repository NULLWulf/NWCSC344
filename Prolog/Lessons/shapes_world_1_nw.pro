% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- File: shapes_world_1.pro
% --- Line: Loosely represented 2-D shapes world (simple take on SHRDLU)
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- Facts ... 7 with original 
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- square(N,side(L),color(C)) :: N is the name of a square with side L
% --- and color C
square(sera,side(7),color(purple)).
square(sara,side(5),color(blue)).
square(sarah,side(11),color(red)).
square(sony,side(8),color(green)).
% -----------------------------------------------------------------------
% --- circle(N,radius(R),color(C)) :: N is the name of a circle with
% --- radius R and color C
circle(carla,radius(4),color(green)).
circle(cora,radius(7),color(blue)).
circle(connie,radius(3),color(purple)).
circle(claire,radius(5),color(green)).

% --- circle(N,radius(R),color(C)) :: N is the name of a circle with
% --- radius R and color C
triangle(terry,base(2),height(2),color(green)).
triangle(tony,base(4),height(8),color(red)).
triangle(tara,base(3),height(2),color(purple)).
triangle(tamara,base(100),height(100),color(blue)).
% -----------------------------------------------------------------------
% Rules ... 9 with original deo
% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- circles :: list the names of all of the circles
circles :- circle(Name,_,_), write(Name),nl,fail.
circles.
% -----------------------------------------------------------------------
% --- squares :: list the names of all of the squares
squares :- square(Name,_,_), write(Name),nl,fail.
squares.

% ------------------------------
% list all of the names of the triangles
triangles :- triangle(Name,_,_,_), write(Name),nl,fail.
triangles.

% -----------------------------------------------------------------------
% --- squares :: list the names of all of the shapes
shapes :- circles,squares,triangles.
% -----------------------------------------------------------------------
% --- blue(Name) :: Name is a blue shape
blue(Name) :- square(Name,_,color(blue)).
blue(Name) :- circle(Name,_,color(blue)).
blue(Name) :- triangle(Name,_,_,color(blue)).

red(Name) :- square(Name,_,color(red)).
red(Name) :- circle(Name,_,color(red)).
red(Name) :- triangle(Name,_,_,color(red)).

green(Name) :- square(Name,_,color(green)).
green(Name) :- circle(Name,_,color(green)).
green(Name) :- triangle(Name,_,_,color(green)).

purple(Name) :- square(Name,_,color(purple)).
purple(Name) :- circle(Name,_,color(purple)).
purple(Name) :- triangle(Name,_,_,color(purple)).

%%% Color Searcher
searcher(Color) :- square(Name,_,color(Color)), 
    write(Name),
    write(' is a'),
    write(Color),nl,fail.

searcher(Color) :- circle(Name,_,color(Color)), 
    write(Name),
    write(' is a'),
    write(Color),nl,fail.

searcher(Color) :- triangle(Name,_,_,color(Color)), 
    write(Name),
    write(' is a'),
    write(Color),nl,fail.
searcher.

% -----------------------------------------------------------------------
% --- large(Name) :: Name is a large shape
large(Name) :- area(Name,A), A >= 100.
% -----------------------------------------------------------------------
% --- small(Name) :: Name is a small shape
small(Name) :- area(Name,A), A < 100.
% -----------------------------------------------------------------------
% --- area(Name,A) :: A is the area of the shape with name Name
area(Name,A) :- circle(Name,radius(R),_), A is 3.14 * R * R.
area(Name,A) :- square(Name,side(S),_), A is S * S.
area(Name,A) :- triangle(Name,base(B),height(H),_), A is 0.5 * B * H.
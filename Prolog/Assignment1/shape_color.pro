% ---------------------------------------------------------------------------
% File: map_coloring.pro
% Line: Program to find a 4 color map rendering for a multi sectioned square 
% More: The colors used will be red, blue, green orange.
% More: The sections in the program correspond to the sections written in the
% multi sectioned square. 

% ---------------------------------------------------------------------------
% different(X,Y) :: X is not equal to Y
different(red,blue).
different(red,green).
different(red,orange).
different(green,blue).
different(green,orange).
different(green,red).
different(blue,green).
different(blue,orange).
different(blue,red).
different(orange,blue).
different(orange,green).
different(orange,red).

% ---------------------------------------------------------------------------
%  coloring(O,M1,M2,M3,M4,N1,N2,N3,N4,N5,N6,N7,N8,I1,I2,I3,I4) 
%  different section combination, there is a different for each connected pair

coloring(O,M1,M2,M3,M4,N1,N2,N3,N4,N5,N6,N7,N8,I1,I2,I3,I4) :-
    different(O,M1),
    different(O,M2),
    different(O,M3),
    different(O,M4),
    different(M1,M3),
    different(M1,M2),
    different(M4,M2),
    different(M4,M3),
    different(M1,N1),
    different(M1,N2),
    different(M2,N3),
    different(M2,N4),
    different(M3,N7),
    different(M3,N8),
    different(M4,N5),
    different(M4,N6),
    different(N1,I1),
    different(N8,I1),
    different(N2,I2),
    different(N3,I2),
    different(N4,I4),
    different(N5,I4),
    different(N6,I3),
    different(N7,I3),
    different(N1,N2),
    different(N3,N4),
    different(N4,N5),
    different(N5,N6),
    different(N6,N7),
    different(N7,N8),
    different(N8,N1),
    different(I1,I2),
    different(I1,I3),
    different(I4,I3),
    different(I4,I2),
    different(I1,I4),
    different(I2,I3).
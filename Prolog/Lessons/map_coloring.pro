% ---------------------------------------------------------------------------
% File: map_coloring.pro
% Line: Program to find a 4 color map rendering for South American coutries.
% More: The colors used will be red, blue, green orange.
% More: The standard abbrieviations are used to stand for the countries.
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
% coloring(AR,UY,BR,CL,PARA,BO,PERU,ECUA,VE,COL,GY,SR,GF) :: The South
% American coutries represented by their standard abbrieviations are colored
% so that none of the countries sharing a border are the same color.
coloring(AR,UY,BR,CL,PARA,BO,PERU,ECUA,VE,COL,GY,SR,GF) :-
different(AR, CL),
different(AR, UY),
different(AR, BR),
different(AR, PARA),
different(AR, BO),
different(CL, BO),
different(CL, PERU),
different(UY, BR),
different(PARA, BR),
different(PARA, BO),
different(BO, BR),
different(BO, PERU),
different(PERU, BR),
different(PERU, ECUA),
different(PERU, COL),
different(ECUA, COL),
different(COL, BR),
different(COL, VE),
different(VE, BR),
different(VE, GY),
different(GY, BR),
different(GY, SR),
different(SR, BR),
different(SR, GF),
different(GF, BR).
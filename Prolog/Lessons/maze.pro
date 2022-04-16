%% connected

connect(start,2).
connect(2,8).
connect(8,9).
connect(3,9).
connect(3,4).
connect(4,10).
connect(10,16).
connect(16,22).
connect(22,21).
connect(21,15).
connect(14,15).
connect(13,14).
connect(13,7).
connect(1,7).
connect(14,20).
connect(20,26).
connect(26,27).
connect(27,28).
connect(28,29).
connect(29,23).
connect(23,17).
connect(11,17).
connect(5,11).
connect(5,6).
connect(28,34).
connect(34,35).
connect(35,36).
connect(36,30).
connect(24,30).
connect(18,24).
connect(12,18).
connect(33,34).
connect(32,33).
connect(32,31).
connect(31,25).
connect(25,19).
connect(32,finish).

connected_to(A,B) :-
    connect(A,B).
connected_to(B,A) :-
    connect(B,A).

% The following 8 moves define all the possible moves a knight
% may make on a chess board, without leaving the chess board. The
% size of the chess board is given by (Xmax, Ymax).

move([X, Y, Xmax, Ymax], [A, B, Xmax, Ymax]) :-
X + 1 < Xmax,
Y + 2 < Ymax,
A is X + 1,
B is Y + 2.

move([X, Y, Xmax, Ymax], [A, B, Xmax, Ymax]) :-
X + 2 < Xmax,
Y + 1 < Ymax,
A is X + 2,
B is Y + 1.

move([X, Y, Xmax, Ymax], [A, B, Xmax, Ymax]) :-
X + 2 < Xmax,
Y - 1 >= 0,
A is X + 2,
B is Y - 1.

move([X, Y, Xmax, Ymax], [A, B, Xmax, Ymax]) :-
X + 1 < Xmax,
Y - 2 >= 0,
A is X + 1,
B is Y - 2.

move([X, Y, Xmax, Ymax], [A, B, Xmax, Ymax]) :-
X - 1 >= 0,
Y - 2 >= 0,
A is X - 1,
B is Y - 2.

move([X, Y, Xmax, Ymax], [A, B, Xmax, Ymax]) :-
X - 2 >= 0,
Y - 1 >= 0,
A is X - 2,
B is Y - 1.

move([X, Y, Xmax, Ymax], [A, B, Xmax, Ymax]) :-
X - 2 >= 0,
Y + 1 < Ymax,
A is X - 2,
B is Y + 1.

move([X, Y, Xmax, Ymax], [A, B, Xmax, Ymax]) :-
X - 1 >= 0,
Y + 2 < Ymax,
A is X - 1,
B is Y + 2.
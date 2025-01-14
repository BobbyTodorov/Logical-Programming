/*
HW:
1. Напишете предикат пресмятащ сумата от елементите на списъка. прим [1,2,3,4] -> сумата е 10
2. Напишете предикат намиращ най-големия/ най-малкия елемент в списък. - има поне два начина да се каже. Единият е с рекурсия и помощна ф-я, 
   а другия игра с квантори.
3. Напишете предикат, който е истина т.с.т.к. X дели Y. прим 5 дели 10, но 5 не дели 27.
*/


% 1.Sum
sum([], 0).
sum([H|T], N):- sum(T, M), N is H + M.


% 2.Min\Max element
% First way
% \+ означава пак not, но е по-лесно за изписване
min1(L, X):- member(X, L), \+ ((member(Y, L), X \= Y, Y < X)).
max1(L, X):- member(X, L), \+ ((member(Y, L), X \= Y, Y > X)).

% Second way
lesser(A, B, A):- A < B.

min2(X, [X]).
min2(X, [H|T]):- min2(M, T), lesser(H, M, X).

max2(X, [X]).
max2(X, [H|T]):- max2(M, T), \+ lesser(H, M, X).


% 3.Div
% Трябва да го има това оценяване стойността на Y, иначе се натрупват (...((Y - X) - X)... - X) и не се изчислява.
div(_, Y):- Y =:= 0.
div(X, Y):- Y >= X, div(X, Y - X).


% Може и така.
% Като има оператор за присвояване към нова променлива се форсира изчисляването на аритметичния израз от лявата страна
% преди да бъде присвоена неговата стойност на новата променлива
div1(_, 0).
div1(X, Y):- Y >= X, Y1 is Y - X, div1(X, Y1).
% Identificadores de sexo:
male(manuel).
male(mario).
male(julio).
male(jaime).
male(carlos).

female(josefina).
female(silvia).
female(ligia).
female(marina).
female(regina).
female(jacinta).
female(nemesia).
female(tere).

% Father:
father(manuel, mario).
father(manuel, ligia).
father(mario, marina).
father(mario, jaime).
father(mario, carlos).
father(julio, regina).
father(julio, jacinta).
father(carlos, tere).

% Mother:
mother(josefina, mario).
mother(josefina, ligia).
mother(silvia, marina).
mother(silvia, jaime).
mother(silvia, carlos).
mother(ligia, regina).
mother(ligia, jacinta).
mother(nemesia, tere).

% Parents:
parent(X, Y) :- father(X, Y) ; mother(X, Y).

% Sons and daughters:
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).

% Siblings:
sibling(X, Y) :- 
    (father(F, X) , father(F, Y)),
    (mother(M, X) , mother(M, Y)),
    \==(X, Y).

% Ancestors:
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

ancestor(X, Y) :- 
    parent(X, Y).
% Identificadores de sexo:
sexo(manuel, m).
sexo(mario, m).
sexo(julio, m).
sexo(jaime, m).
sexo(carlos, m).

sexo(josefina, f).
sexo(silvia, f).
sexo(ligia, f).
sexo(marina, f).
sexo(regina, f).
sexo(jacinta, f).
sexo(nemesia, f).
sexo(tere, f).

% Padres:
padre(manuel, mario).
padre(manuel, ligia).
padre(mario, marina).
padre(mario, jaime).
padre(mario, carlos).
padre(julio, regina).
padre(julio, jacinta).
padre(carlos, tere).

% Madres:
madre(josefina, mario).
madre(josefina, ligia).
madre(silvia, marina).
madre(silvia, jaime).
madre(silvia, carlos).
madre(ligia, regina).
madre(ligia, jacinta).
madre(nemesia, tere).

% Abuelos:

% Abuelo:
abuelo(X, Y):-
    padre(X, Z),
    padre(Z, Y).

abuelo(X, Y):-
    padre(X, Z),
    madre(Z, Y).

% Abuela:
abuela(X, Y):-
    madre(X, Z),
    padre(Z, Y).

abuela(X, Y):-
    madre(X, Z),
    madre(Z, Y).

% abuelos(X, Y):-
%     abuelo(X, Y) ; abuela(X, Y).

abuelos(X, Y):-
    abuelo(X, Y).

abuelos(X, Y):-
    abuela(X, Y).

% hermanos:
hermano(X, Y):-
    sexo(X, m),
    padre(P, X),
    padre(P, Y),
    madre(M, X),
    madre(M, Y),
    \==(X, Y).

hermana(X, Y):-
    sexo(X, f),
    padre(P, X),
    padre(P, Y),
    madre(M, X),
    madre(M, Y),
    \==(X, Y).

% ELABORAR LAS REGLAS: tios/2, primos/2.
% Expicar cómo Prolog ejecuta una regla.
% Backtracking y otros predicados. Dar ejemplos.

% Relación tio/2:
tio(X, Y):-
    padre(P, Y),
    hermano(X, P).

tio(X, Y):-
    madre(M, Y),
    hermano(X, M).

% Relación tia/2:
tia(X, Y):-
    padre(P, Y),
    hermana(X, P).

tia(X, Y):-
    madre(M, Y),
    hermana(X, M).

% Relación primo/2:
primos(X, Y):-
    (   padre(U, X) ; madre(U, X)),
    (   padre(V, Y) ; madre(V, Y)),
    (   hermano(U, V) ; hermana(U, V)).

% antepasado:
antepasado(X, Y) :-
    padre(X, Y).

antepasado(X, Y) :-
    madre(X, Y).

antepasado(X, Y) :- 
    padre(P, Y),
    antepasado(X, P).

antepasado(X, Y) :- 
    madre(P, Y),
    antepasado(X, P).

% Mostrar líneas de antepasados de una persona:
linea_antepasados(X):-
    \+ padre(_, X),
    writeln('---'),
    !.

linea_antepasados(X):-
    \+ madre(_, X),
    writeln('---'),
    !.

linea_antepasados(X):-
    padre(P,  X),
    linea_antepasados(P),
    writeln(P).

linea_antepasados(X):-
    madre(P,  X),
    linea_antepasados(P),
    writeln(P).

% Mostrar líneas de descendientes de una persona:
linea_descendientes(X):-
    padre(X, H),
    linea_descendientes(H),
    writeln(H).

linea_descendientes(X):-
    madre(X, H),
    linea_descendientes(H),
    writeln(H).

linea_descendientes(X):-
    \+ padre(X, _),
    writeln('---'),
    !.

linea_descendientes(X):-
    \+ madre(X, _),
    writeln('---'),
    !.

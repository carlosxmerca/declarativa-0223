% SEC 1
% Jose Miguel Acosta Vasquez 00008020
% Carlos Eduardo Mercado Gutierrez 00058820

% Ejercicio 1

:- dynamic funcion/2.

% Esta funcion es PRIVADA no se tiene que usar
construir_funcion(X, X1, Y1, X2, Y2, M*X+B) :-
    is(M, (Y2-Y1)/(X2-X1)),
    % writeln(M),
    is(B, Y1-(M*X1)).
    % writeln(B).

almacenar_funcion(X1, Y1, X2, Y2) :-
    construir_funcion(X, X1, Y1, X2, Y2, F),
    assert(funcion(X, F)).

evaluar_funcion(X0, Y) :-
    funcion(X, F),
    writeln(F),
    X is X0, 
    Y is F.

% Ejemplo de uso:
% almacenar_funcion(0, 2, 2, 6). -> F = 2X + 2
% evaluar_funcion(4, Y).         -> Y = 10

% +++++++++++++++++++++++++++++++++++++++++++++ 

% Ejercicio 2

crearSecuencia([], []).
crearSecuencia([[N, Char] | RestoEntrada], [Secuencia | RestoSalida]) :-
    crearSubsecuencia(N, Char, Secuencia),
    crearSecuencia(RestoEntrada, RestoSalida).

crearSubsecuencia(0, _, []).
crearSubsecuencia(N, Char, [Char | RestoSecuencia]) :-
    N > 0,
    N1 is N - 1,
    crearSubsecuencia(N1, Char, RestoSecuencia).

% Ejemplo de uso:
% crearSecuencia([[3, x], [1, y], [2, z]], W). -> W = [[x, x, x], [y], [z, z]]

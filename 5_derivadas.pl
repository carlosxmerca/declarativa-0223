% Derivada de una constante:
d(X, C, 0):- number(C), var(X), !.

% Derivada de X respecto a X:
d(X, X, 1):- var(X), !.

% Derivada de X a la N:
d(X, X^N, N*X^N1):- 
    var(X),
    number(N), 
    is(N1, -(N, 1)), 
    !.

% Derivada de una constante por X:
d(X, C*X, C):- var(X), number(C), !.

% Derivada de una constante por X a la N:
d(X, C*X^N, Coef*X^N1):-
    var(X),
    number(C),
    number(N),
    is(N1, -(N, 1)),
    is(Coef, *(C, N)),
    !.

% Derivada de la suma de dos funciones:
d(X, A + B, DxA + DxB):-
    d(X, A, DxA),
    d(X, B, DxB),
    !.

% Derivada de la resta de dos funciones:
d(X, A - B, DxA - DxB):-
    d(X, A, DxA),
    d(X, B, DxB),
    !.

% Derivada de a elevada a la X:
d(X, C^X, C^X*log(C)):- var(X), number(C), !.

% Colecciones
:- dynamic funcion_derivada/3.

% Regla general
de(X, F, FP) :- 
    d(X, F, FP),
    assert(funcion_derivada(X, F, FP)).


ver_funciones_derivadas() :-
    listing(funcion_derivada).

% Implementación del método de Newton-Raphson
newton_raphson_start(X, F, X0, Tolerancia, Raiz) :-
    de(X, F, _),
    % funcion_derivada(X, FS, FP),
    newton_raphson(X0, Tolerancia, Raiz).

% Caso base: detenerse cuando la diferencia entre X0 y X1 es menor que la tolerancia
newton_raphson(X0, Tolerancia, X1) :-
    funcion_derivada(X, F, FP),
    X is X0,
    Fx0 is F,
    X1 is X0 - Fx0 / FP,
    abs(X1 - X0) < Tolerancia, 
    !.

% Paso de iteración del método de Newton-Raphson
newton_raphson(X0, Tolerancia, Raiz) :-
    funcion_derivada(X, F, FP),
    % writeln("Iterando"),
    % write("F: "), write(F),
    % writeln(""),
    % write("FP: "), write(FP),
    % writeln(""),
    X is X0,
    Fx0 is F,
    X1 is X0 - Fx0 / FP,
    % write("Fx0: "), write(Fx0),
    % writeln(""),
    % write("X0: "), write(X0),
    % writeln(""),
    % write("FP: "), write(FP),
    % writeln(""),
    % write("X1: "), write(X1),
    % writeln(""),
    newton_raphson(X1, Tolerancia, Raiz).

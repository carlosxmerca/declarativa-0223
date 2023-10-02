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

derivar(F, X0, R) :-
    de(X, F, Derivada),
    X is X0,
    R is Derivada.

ver_funciones_derivadas() :-
    listing(funcion_derivada).

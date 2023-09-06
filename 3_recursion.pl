% Ejemplos basicos:

% Contar desde X hasta N
contarN(N) :- 
    contarN(1, N).

contarN(X, N) :- 
    =:=(X, N),
    writeln(X),
    !.

contarN(X, N) :- 
    <(X, N),
    writeln(X),
    is(Xsig, +(X, 1)),
    contarN(Xsig, N).

% Sumar la cuenta desde desde X hasta N
sumarN(N) :- 
    sumarN(1, 0, N).

sumarN(A, R, N) :- 
    >(A, N),
    writeln(R),
    !.

sumarN(X, R, N) :- 
    =<(X, N),
    is(NewR, +(R, X)),
    sumarN(+(X, 1), NewR, N).

% Factorial la cuenta desde desde X hasta N
factorialN(N) :- 
    factorialN(1, 1, N).

factorialN(A, R, N) :- 
    >(A, N),
    writeln(R),
    !.

factorialN(X, R, N) :- 
    =<(X, N),
    is(NewR, *(R, X)),
    factorialN(+(X, 1), NewR, N).

% Factorial de un número:
factorial(0, 1):- !.

factorial(1, 1):- !.

factorial(N, Fact):-
    >(N, 1),
    is(Nm1, -(N, 1)),
    factorial(Nm1, FactAux),
    is(Fact, *(N, FactAux)).

% Calcuar el n-ésimo término de
% la serie de fibonacci:
fibo(1, 0):- !.

fibo(2, 1):- !.

fibo(N, Fn):-
    is(Nm1, -(N, 1)),
    fibo(Nm1, Fnm1),
    is(Nm2, -(N, 2)),
    fibo(Nm2, Fnm2),
    is(Fn, +(Fnm1, Fnm2)).

% Suma de los enteros comprendidos en un intervalo:
suma_intervalo(A, B, B):-
    =:=(A, B),
    !.

suma_intervalo(A, B, S):-
    <(A, B),
    is(Asig, +(A, 1)),
    suma_intervalo(Asig, B, Saux),
    is(S, +(Saux, A)).
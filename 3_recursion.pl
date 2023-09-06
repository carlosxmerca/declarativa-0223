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
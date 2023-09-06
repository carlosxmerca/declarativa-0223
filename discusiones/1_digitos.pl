% Sumar todos los digitos de un numero

sumar_digitos(N, M) :-
    number(N),
    sumar(N, 0, M).

sumar(0, M, M) :- !.

sumar(N, V, M) :-
    N > 0,
    Res is N mod 10,
    C is N // 10,
    V1 is V + Res,
    sumar(C, V1, M).

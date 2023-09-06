% Escriba las siguientes expresiones aritméticas en forma prefija, evalúelas y pruebe,
% en el intérprete de Prolog si se obtienen los resultados correctos.

% use_module(library(math)).

% 1-B -> −0.1494
ej_1b(X) :-
    is(A, sin(30)),
    is(B, **(2, 3)),
    is(C, sqrt(+(**(9, 2), 10))),
    is(X, +(A, /(B, C))).

% 1-E -> −18.1358
ej_1e(X) :-
    A is 4 * tan(25) - 3,
    B is sqrt((9/2) - sin(15)),
    C is 10 * log10(43),
    X is (A/B) - C.

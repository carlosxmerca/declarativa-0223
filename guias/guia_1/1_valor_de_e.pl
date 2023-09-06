% El valor de e (base de los logaritmos naturales), se puede aproximar por la
% sumatoria que se muestra abajo. Elabore la regla aprox_e/2 que calcule una
% aproximación del valor de e para una cantidad, n, determinada de términos. En el
% primer argumento se coloca el valor de n y en el segundo se recibe el valor
% calculado.

% Caso base: El factorial de 0 es 1.
factorial(0, 1).

% Caso recursivo: El factorial de N es N multiplicado por el factorial de N-1.
factorial(N, Resultado) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, Subresultado),
    Resultado is N * Subresultado.

aprox_e(K, X) :-
    K > 0,
    K1 is K - 1,
    factorial(K, Y),
    aprox_e(K1, Sub),
    X is Sub + (1 / Y).

aprox_e(0, X) :-
    X is 1.

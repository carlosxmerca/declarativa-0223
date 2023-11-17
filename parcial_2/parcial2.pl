% Parcial 2
% José Miguel Acosta Vásquez 00008020  
% Carlos Eduardo Mercado Gutiérrez 00058820

% Ejercicio 1

bucle(Vertice, [Vertices, Aristas]) :-
    \+ member(Vertice, Vertices),
    writeln('El vertice no existe en el grafo'),
    fail,
    !.

bucle(Vertice, [Vertices, Aristas]) :-
    member(Vertice, Vertices),
    member([Vertice, Vertice], Aristas).

% Ejemplo existoso
% bucle(d, [[a, b, c, d, e], [[a, c], [b, a], [b, c], [b, e], [c, e], [d, a], [d, b], [d, d], [d, e], [e, d]]]).

% Ejemplo fallido
% bucle(a, [[a, b, c], [[a, b], [b, c], [c, d]]]).

% Ejemplo de vertice no existente
% bucle(x, [[a, b, c, d, e], [[a, c], [b, a], [b, c], [b, e], [c, e], [d, a], [d, b], [d, d], [d, e], [e, d]]]).

% Ejercicio 2

% Colecciones
:- dynamic funcion_integrada/2.

% Integrales:
i(X, C, C*X):- number(C), var(X), !.

i(X, C*X^N, (C/N1)*X^N1):- 
    var(X), 
    N1 is N + 1, 
    !.

i(X, A + B, IxA + IxB):-
    i(X, A, IxA),
    i(X, B, IxB),
    !.

i(X, A - B, IxA - IxB):-
    i(X, A, IxA),
    i(X, B, IxB),
    !.

evaluar_integral(X0, R) :-
    funcion_integrada(X, Tmp),
    X is X0,
    R is Tmp.

% Obtener area bajo la curva
area(X, F, Inf, Sup, R) :-
    i(X, F, Integral),
    assert(funcion_integrada(X, Integral)),
    evaluar_integral(Inf, RInf),
    evaluar_integral(Sup, RSup),
    R is RSup - RInf,
    abolish(funcion_integrada/2).

% Ejemplo de uso 1
% area(X, -3*X^3+2*X^2+2, 0, 1, R). % R -> 1.9166666666666665.
% Ejemplo de uso 2
% area(X, 6*X^2+7*X^5, 0, 5, R). % R -> 18479.166666666668.

% Ejercicio 3
% Obtener promedio de los valores de un ABB
media_aritmetica(ABB, Prom) :-
    sumar_y_contar_arbol(ABB, Suma, N),
    Prom is Suma / N.

% Predicado para sumar elementos numéricos y contar elementos en un árbol.
sumar_y_contar_arbol([], 0, 0).
sumar_y_contar_arbol(N, N, 1) :- number(N).
sumar_y_contar_arbol([Izq, Valor, Der], Suma, Contador) :-
    sumar_y_contar_arbol(Izq, SumaIzq, ContadorIzq),
    sumar_y_contar_arbol(Der, SumaDer, ContadorDer),
    (number(Valor) -> sumar_y_contar_arbol(Valor, SumaValor, ContadorValor) ; SumaValor = 0, ContadorValor = 0),
    Suma is SumaIzq + SumaDer + SumaValor,
    Contador is ContadorIzq + ContadorDer + ContadorValor.

% Ejemplo de uso 1:
% media_aritmetica([[[], 25, []], 50, [[], 75, []]], Prom). % Prom -> 50
% Ejemplo de uso 2:
% media_aritmetica([[[], 25, []], 50, [[], hola, []]], Prom). % Prom -> 37.5

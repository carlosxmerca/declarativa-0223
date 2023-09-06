% El enemigo de mi enemigo, es mi amigo. La historia de la humanidad está plagada
% de guerras. Reyes, presidentes, conquistadores y estrategas de las batallas han
% debido conseguir, cuando es necesario, aliados para vencer a su oponente. Elabore
% la regla aliado/3 en la que el primer argumento es alguien que quiere vencer a la
% persona indicada en el segundo argumento. El tercer argumento es el posible
% aliado del primero. La cláusula debe verificar si los primeros dos son enemigos
% mutuos y luego verificar si el tercer argumento es enemigo del segundo. Elabore la
% relación enemigo/2 para varios individuos y pruebe la regla elaborada

enemigo(rusia, ucrania).
enemigo(ucrania, rusia).
enemigo(rusia, japon).
enemigo(japon, rusia).
enemigo(china, usa).
enemigo(usa, china).
enemigo(cuba, usa).

no_enemigo(X, Y) :-
    not(enemigo(X, Y)),
    not(enemigo(Y, X)).

% Esto es cuestionable
aliado(X, Y, Z) :-
    no_enemigo(X, Y),
    no_enemigo(X, Z),
    no_enemigo(Y, Z),
    dif(X, Y),
    dif(X, Z),
    dif(Y, Z).

% Esta es la buena
aliado2(X, Y, Z) :-
    enemigo(Z, Y),
    not(enemigo(X, Z)),
    not(enemigo(Z, X)),
    dif(X, Y),
    dif(X, Z),
    dif(Y, Z).

% Pepito se escapó de su casa y se fue con sus amigos al centro comercial. Estando
% allí se da cuenta de que sus papas también han ido de compras. Elabore una base
% de conocimiento que le ayude a Pepito a no “encontrarse” con sus papás en ningún
% lugar del centro comercial, es decir, la base de conocimiento debe conocer los
% locales y decirle a Pepito en qué lugares del centro comercial podrá estar sin ser
% visto. En muchas ocasiones su papá y su mamá deciden separarse e ir a locales
% distintos para terminar las compras más rápido. Elabore una regla de aridad tres a
% la que se le indique por medio de dos argumentos en cuál local está su mamá y en
% cuál está su papá. En el tercer argumento de la cláusula se devuelven los locales
% en los que Pepito puede estar.

lugar(kfc).
lugar(cadejo).
lugar(cine).
lugar(salon).
lugar(super).
lugar(game_store).
lugar(boliche).
lugar(parqueo).

esta_en(papa, kfc).
esta_en(papa, cadejo).
esta_en(papa, cine).
esta_en(mama, cine).
esta_en(mama, salon).
esta_en(mama, super).

ir_pepito(P, M, X) :-
    lugar(X),
    not(esta_en(P, X)),
    not(esta_en(M, X)).

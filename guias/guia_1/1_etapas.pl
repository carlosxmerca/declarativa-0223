% Dado el conjunto de hechos que se muestra, escriba la regla proxima_etapa/1, a la
% que se le pasa un valor de tipo entero. El propósito de esta cláusula es mostrar en
% pantalla los nombres de todas las etapas de fabricación faltantes a partir de una
% cuyo valor se le ha pasado como parámetro. Nota: los nombres a desplegar los
% debe tomar de la base de hechos.

paso(1, medicion).
paso(2, corte).
paso(3, modelado).
paso(4, pulido).
paso(5, montaje).
paso(6, empacado).
paso(7, almacenaje).

prox_etapa(E) :-
    E < 7,
    E1 is E + 1,
    paso(E1, Y),
    writeln(Y),
    prox_etapa(E1).

prox_etapa(E) :-
    E >= 7,
    writeln('Proceso concluido').

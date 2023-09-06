% Un restaurante quiere mostrar a sus clientes información nutricional sobre la
% comida que ofrece en el menú. Para completar un poco la información que
% tenemos sobre las comidas del restaurante vamos a mirar la lista de las calorías
% que aporta cada plato:
% > Una ración de paella aporta 200 calorías
% > Una ración de gazpacho aporta 150 calorías
% > Una ración de filete de cerdo aporta 400 calorías
% > Una ración de consomé aporta 300 calorías
% > Una ración de pollo asado aporta 280 calorías
% > Una ración de trucha aporta 160 calorías
% > Una ración de bacalao aporta 300 calorías
% > Una ración de flan aporta 200 calorías
% > Una ración de nueces con miel aporta 500 calorías
% > Una ración de naranja aporta 50 calorías
% Se le pide definir:

% a. Defina la relación calorias/2 que indicará que una ración de cada
% alimentotiene de los de la lista tiene determinadas calorías.
% b. La regla valor_calorico(X, Y, Z, V) que indicará que las porciones X, Y y
% Z de la comida suma en total V calorías.
% c. Definir la cláusula comida_equilibrada(X, Y, Z) que indicará si la comida
% supera o no las 800 calorías.

calorias(paella, 200).
calorias(gazpacho, 150).
calorias(filete_cerdo, 400).
calorias(consome, 300).
calorias(pollo, 280).
calorias(trucha, 160).
calorias(bacalao, 300).
calorias(flan, 200).
calorias(nueces, 500).
calorias(naranja, 50).

valor_calorico(X, Y, Z, V) :-
    calorias(X, A),
    calorias(Y, B),
    calorias(Z, D),
    V is A + B + D.

comida_equilibrada(X, Y, Z) :-
    valor_calorico(X, Y, Z, V),
    V =< 800,
    writeln('La comida esta equilibrada').
    
comida_equilibrada(X, Y, Z) :-
    valor_calorico(X, Y, Z, V),
    V > 800,
    writeln('La comida NO esta equilibrada').

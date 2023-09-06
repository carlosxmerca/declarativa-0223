% divinar un número secreto en el rango de 1 a 100, que debe ser generado
% aleatoriamente. Debe indicar, para cada intento del usuario, si el número secreto
% es mayor, si es menor o se ha acertado. Al final, también desplegar la cantidad
% de intentos realizados. Investigue el funcionamiento del predicado predefinido
% random/1

solicitar_numero(Resultado) :-
    write('Por favor, ingresa un numero: '),
    read(Resultado).

generar_numero_aleatorio(Min, Max, Numero) :-
    random(Min, Max, Numero).

adivinar(X) :-
    solicitar_numero(Y),
    adivinar_numero(Y, X).

adivinar_numero(Actual, X) :-
    Actual < X,
    writeln('Escogiste un numero menor'),
    adivinar(X).

adivinar_numero(Actual, X) :-
    Actual > X,
    writeln('Escogiste un numero mayor'),
    adivinar(X).

adivinar_numero(X, X) :-
    writeln('Adivinaste el numero').

empezar_juego() :-
    generar_numero_aleatorio(1, 100, X),
    adivinar(X).

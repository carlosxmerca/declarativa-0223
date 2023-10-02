% José Miguel Acosta Vásquez 00008020  
% Carlos Eduardo Mercado Gutiérrez 00058820

lugar(calle).
lugar(cochera).
lugar(sala).
lugar(cuarto_de_estudio).
lugar(cocina).
lugar(comedor).
lugar(pasillo_1).
lugar(lavadero).
lugar(bano).
lugar(pasillo_2).
lugar(cuarto_de_rodri).
lugar(cuarto_papas).
lugar(jardin).
lugar(quiosco).

objeto(pantuflas).
objeto(flores).
objeto(pisto).
objeto(agua).
objeto(limones).
objeto(papel_higienico).
objeto(revista_3x).

conecta_con(calle, cochera).
conecta_con(cochera, calle).
conecta_con(cochera, sala).
conecta_con(sala, cochera).
conecta_con(sala, pasillo_1).
conecta_con(pasillo_1, sala).
conecta_con(cuarto_de_estudio, pasillo_1).
conecta_con(pasillo_1, cuarto_de_estudio).
conecta_con(cocina, pasillo_1).
conecta_con(pasillo_1, cocina).
conecta_con(comedor, pasillo_1).
conecta_con(pasillo_1, comedor).
conecta_con(pasillo_1, pasillo_2).
conecta_con(pasillo_2, pasillo_1).
conecta_con(bano, pasillo_2).
conecta_con(pasillo_2, bano).
conecta_con(cuarto_papas, pasillo_2).
conecta_con(pasillo_2, cuarto_papas).
conecta_con(cuarto_de_rodri, pasillo_2).
conecta_con(pasillo_2, cuarto_de_rodri).
conecta_con(lavadero, cocina).
conecta_con(cocina, lavadero).
conecta_con(lavadero, jardin).
conecta_con(jardin, lavadero).
conecta_con(pasillo_2, jardin).
conecta_con(jardin, pasillo_2).
conecta_con(jardin, quiosco).
conecta_con(quiosco, jardin).

esta_en(pantuflas, cuarto_de_rodri).
esta_en(flores, jardin).
esta_en(pisto, cuarto_papas).
esta_en(agua, cocina).
esta_en(limones, jardin).
esta_en(papel_higienico, bano).
esta_en(revista_3x, quiosco).

:- dynamic visitado/1.

ir_hacia(X, Y):-
    abolish(visitado, 1),
    assert(visitado(X)),
    ir_hacia_rec(X, Y),
    writeln(X).

ir_hacia_rec(X, Y):-
    conecta_con(X, Y),
    writeln(Y),
    assert(visitado(Y)),
    !.

ir_hacia_rec(X, _):-
    conecta_con(X, Z),
    visitado(Z),
    fail.

ir_hacia_rec(X, Y):-
    conecta_con(X, Z),
    not(visitado(Z)),
    assert(visitado(Z)),
    ir_hacia_rec(Z, Y),
    writeln(Z),
    !.

traer(X, _):-
    not(lugar(X)),
    writeln("El lugar de origen no existe"),
    !.

traer(_, Y):-
    not(objeto(Y)),
    writeln("El objeto solicitado no existe"),
    !.

traer(X, Z):-
    esta_en(Z, Y),
    ir_hacia(X, Y),
    writeln("-----------"),
    ir_hacia(Y, X).

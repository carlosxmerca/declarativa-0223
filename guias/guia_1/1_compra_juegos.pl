% Javito, Pepito y Rodri se entretienen mucho jugando juegos de video. Entre los
% tres acumulan y comparten montañas de juegos. Un día se le ocurre a Javito ir a
% conseguir más juegos al centro comercial. Pero como no van sus amigos, necesita
% que usted le programe una base de conocimiento la cual él pueda consultar para
% verificar si sus amigos ya cuentan con determinado juego. Elabore la regla
% comprar_juego/1, la cual recibe como argumento el nombre del juego que Javito
% desea comprar. Este juego debe estar a la venta en la tienda, si ninguno de sus
% amigos lo tiene, la cláusula le responde afirmativamente, pero si alguno de sus
% amigos, o él, ya lo tienen, la cláusula le responderá negativamente. Además de la
% regla que se le pide, la base de conocimiento contará con los hechos: juego/1,
% tiene/2. Elabore y haga pruebas de funcionamiento del ejercicio.

juego(mario_kart).
juego(mario_galaxy).
juego(god_of_war).
juego(the_last_of_us).
juego(dark_souls).
juego(need_for_speed).
juego(gta5).

tiene(pepito, mario_kart).
tiene(pepito, mario_galaxy).
tiene(pepito, need_for_speed).
tiene(rodri, mario_kart).
tiene(rodri, the_last_of_us).

comprar_juego(X) :-
    juego(X),
    not(tiene(pepito, X)),
    not(tiene(rodri, X)).

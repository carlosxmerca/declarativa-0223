% Programacion declarativa
% Corto #1
% Carlos Eduardo Mercado Gutierrez - 00058820

fase(huevo).
fase(embrion).
fase(renacuajo).
fase(renacuajo_con_dos_patas).
fase(renacuajo_con_cuatro_patas).
fase(rana_de_cola_corta).
fase(rana_adulta).

le_sigue(huevo, embrion).
le_sigue(embrion, renacuajo).
le_sigue(renacuajo, renacuajo_con_dos_patas).
le_sigue(renacuajo_con_dos_patas, renacuajo_con_cuatro_patas).
le_sigue(renacuajo_con_cuatro_patas, rana_de_cola_corta).
le_sigue(rana_de_cola_corta, rana_adulta).
le_sigue(rana_adulta, huevo).

metamorfosis() :-
    writeln('Se debe enviar un argumento'),
    fail,
    !.

metamorfosis(X) :-
    not(fase(X)),
    writeln('La fase proporcionada no existe en la BC'),
    fail,
    !.

metamorfosis(rana_adulta) :-
    writeln('No hay mas fases'),
    !.

metamorfosis(X) :-
    le_sigue(X, Y),
    writeln(Y),
    metamorfosis(Y).

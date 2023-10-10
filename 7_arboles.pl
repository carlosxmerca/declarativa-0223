% Insertar nodo en un arbol
ins_abb([SI, Dato, SD], Dato, [SI, Dato, SD]) :-
    writeln("El dato ya se encuentran en en el arbol"),
    !.

ins_abb([ ], Dato, [[], Dato, []]) :- !.

ins_abb([SI, DatoN, SD], Dato, [SI2, DatoN, SD]) :-
    <(Dato, DatoN),
    ins_abb(SI, Dato, SI2),
    !.

ins_abb([SI, DatoN, SD], Dato, [SI, DatoN, SD2]) :-
    >(Dato, DatoN),
    ins_abb(SD, Dato, SD2),
    !.

% T = [[[], 20, []], 50, [[], 60, []]].
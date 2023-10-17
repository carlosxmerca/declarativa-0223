% Recorrer un ABB in-order
mostrarArbolInorden([]).
mostrarArbolInorden([SI, Dato, SD]) :-
    mostrarArbolInorden(SI),
    write(Dato), write(' '),
    mostrarArbolInorden(SD).

% Altura de un ABB
altura([], 0) :- !.
altura([SI, _, SD], H) :-
    altura(SI, HI),
    altura(SD, HD),
    is(H, +(1, max(HI, HD))).

% Busqueda de un elemento en el ABB
buscarABB(Elemento, []) :-
    write('El elemento: '), write(Elemento), 
    write(', NO se encuentra en el arbol'),
    !.

buscarABB(Elemento, [_,Elemento,_]) :-
    write('Se ha encontrado el elemento: '), write(Elemento),
    !.

buscarABB(Elemento, [SI, Dato, _]) :-
    <(Elemento, Dato),
    buscarABB(Elemento, SI),
    !.

buscarABB(Elemento, [_, Dato, SD]) :-
    >(Elemento, Dato),
    buscarABB(Elemento, SD).

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

% Eliminar una hoja de un árbol binario
% de búsqueda:
eliminar_hoja_abb([ ], _, [ ]):-
    writeln('El dato no se encuentra en el árbol'),
    !.

eliminar_hoja_abb([[ ], Dato, [ ]], Dato, [ ]):-
    writeln('El dato ha sido eliminado'),
    !.

eliminar_hoja_abb([SI, Dato, SD], Dato, [SI, Dato, SD]):-
    writeln('El dato no es una hoja.'),
    writeln('No ha sido eliminado'),
    !.

eliminar_hoja_abb([SI, DatoN, SD], Dato, [SI2, DatoN, SD]):-
    <(Dato, DatoN),
    eliminar_hoja_abb(SI, Dato, SI2),
    !.

eliminar_hoja_abb([SI, DatoN, SD], Dato, [SI, DatoN, SD2]):-
    >(Dato, DatoN),
    eliminar_hoja_abb(SD, Dato, SD2).

% T = [[[], 20, []], 50, [[], 60, []]].
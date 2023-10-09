% Devolver la posicion de un elementos de la lista 0 based
buscar_elemento(Elemento, [Elemento|_], Posicion, Posicion).
buscar_elemento(Elemento, [_|Resto], PosicionActual, Posicion) :-
    NuevaPosicion is PosicionActual + 1,
    buscar_elemento(Elemento, Resto, NuevaPosicion, Posicion).

% Sumar todos los elementos de una lista
sumar_elementos([], 0).
sumar_elementos([Elemento|Resto], Suma) :-
    sumar_elementos(Resto, SumaResto),
    Suma is SumaResto + Elemento.

% Sumar los elementos menores que Ref que se encuentran en la lista
sumar_elementos_menores(_, [], 0).
sumar_elementos_menores(Ref, [Elemento|Resto], Suma) :-
    Elemento < Ref,
    sumar_elementos_menores(Ref, Resto, SumaResto),
    Suma is SumaResto + Elemento.
sumar_elementos_menores(Ref, [Elemento|Resto], Suma) :-
    Elemento >= Ref,
    sumar_elementos_menores(Ref, Resto, Suma).


% Funcion devuelve una lista con datos introducidos desde el teclado, debe 
% terminar cuando reciba la tecla "t".

% Primero, la función muestra un mensaje en la pantalla usando write/1 
% para solicitar al usuario que introduzca un elemento, o que presione "t" para terminar la entrada.

% Luego, utiliza read/1 para leer una línea de entrada desde el usuario 
% y almacena el valor leído en la variable Elemento.

% A continuación, la función verifica si el Elemento leído es igual a "t" 
% utilizando una estructura condicional (->). Si es igual a "t", entonces termina la 
% construcción de la lista y la asigna como una lista vacía ([]) a la variable Lista.

% Si el Elemento no es igual a "t", la función llama recursivamente a 
% leer_lista/1 para continuar leyendo más elementos desde el teclado. 
% Luego, agrega el Elemento a la lista obtenida de la llamada recursiva 
% para formar una nueva lista llamada Resto.

% Finalmente, construye la Lista completa agregando el Elemento al frente de Resto. 
% Esto se hace con la expresión Lista = [Elemento | Resto].

% De esta manera, la función leer_lista/1 lee elementos uno por uno hasta que 
% se ingresa "t" y construye una lista con esos elementos. La lista resultante 
% contendrá todos los elementos ingresados antes de "t"
leer_lista(Lista) :-
    write('Introduce un elemento (o "t" para terminar): '),
    read(Elemento),
    (Elemento = 't' ->
        Lista = []
    ;
        leer_lista(Resto),
        Lista = [Elemento | Resto]
    ).

% Predicado principal para comenzar la lectura
iniciar_lectura(Lista) :-
    leer_lista(Lista).

% Eliminar cabeza de lista
eliminar_cabeza([_ | Col], Col) :- !.

% Eliminar un elemento de lista
eliminar_elemento([], _, []) :- !.
eliminar_elemento([Elemento | Col], Elemento, Col) :- !.
eliminar_elemento([Cab | Col], Elemento, [Cab | Ltemp]) :-
    eliminar_elemento(Col, Elemento, Ltemp).

% Eliminar todas las ocurrencias de un elemento en la lista
eliminar_ocurrencias([], _, []) :- !.
eliminar_ocurrencias([Elemento | Col], Elemento, Ltemp) :- 
    eliminar_ocurrencias(Col, Elemento, Ltemp),
    !.

eliminar_ocurrencias([Cab | Col], Elemento, [Cab | Ltemp]) :-
    eliminar_ocurrencias(Col, Elemento, Ltemp).

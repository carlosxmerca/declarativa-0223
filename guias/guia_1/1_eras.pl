% En la siguiente figura puede ver cinco eras geológicas de la tierra. A estas eras les
% pertenecen un total de quince períodos, por ejemplo, a la era Precámbrica le
% pertenecen los períodos Algónquico y Arcaico; a la era Mesozoica le pertenecen los
% períodos Jurásico, Cretácico y Triásico; etc. Tanto las eras, como los períodos se
% encuentran ordenados cronológicamente, de izquierda a derecha en la figura. En
% base a esto, se le pide:

% a) Elabore una cláusula que, dado un período, indique todos los períodos que
% están antes de él.Elabore una cláusula que, dado un período, indique todos los
% períodos que están después de él. Para este literal y el anterior utilice
% relaciones del tipo le_sigue(<periodo anterior>, <periodo posterior>).

% b) Elabore una cláusula que indique, dada una era geológica, cuales períodos le
% pertenecen. Para resolver esta cláusula utilice relaciones le_pertenece(<era>,
% <periodo>)

era_geologica(arcaica).
era_geologica(paleozoica).
era_geologica(mesozoica).
era_geologica(mozoica).
era_geologica(antropozoica).

le_sigue(arcaica, paleozoica).
le_sigue(paleozoica, mesozoica).
le_sigue(mesozoica, mozoica).
le_sigue(mozoica, antropozoica).

periodo(algonquico).
periodo(arcaico).
periodo(cambrico).
periodo(silurico).
periodo(carbonifero).
periodo(devonico).
periodo(pernico).

le_pertenece(arcaica, algonquico).
le_pertenece(arcaica, arcaico).
le_pertenece(paleozoica, cambrico).
le_pertenece(paleozoica, silurico).
le_pertenece(paleozoica, carbonifero).
le_pertenece(paleozoica, devonico).
le_pertenece(paleozoica, pernico).

% Obtener todos los periodos antes de...
era_anterior(X, Y) :- le_sigue(X, Y).
era_anterior(X, Y) :- le_sigue(X, Z), era_anterior(Z, Y).

% Obtener todos los periodos despues de...
era_posterior(X) :-
    le_sigue(X, Y),
    writeln(Y),
    era_posterior(Y).
era_posterior(_).

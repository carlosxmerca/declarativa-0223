crear_archivo :-
    open('prueba.txt', write, Document),
    close(Document).

leer_archivo :-
    open('texto.txt', read, Document),
    leer(Document),
    close(Document).

leer(Document) :-
    read(Document, Data),
    probar(Data, Document).

probar(end_of_file, _) :-
    writeln('Se ha llegado al final del documento').

probar(Data, Document) :-
    writeln(Data),
    writeln('Aun hay datos en el documento'),
    leer(Document).

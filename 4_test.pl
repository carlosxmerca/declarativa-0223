% Backtracking y otros predicados. 
algo(este).
algo(aquel).

prueba(X):-
    !, algo(X).

padreDe(abe, abbie).
padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(clancy, marge).
padreDe(clancy, patty).
padreDe(clancy, selma).
padreDe(homero, bart).
padreDe(homero, hugo).
padreDe(homero, lisa).
padreDe(homero, maggie).

madreDe(edwina, abbie).
madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(jacqueline, marge).
madreDe(jacqueline, patty).
madreDe(jacqueline, selma).
madreDe(marge, bart).
madreDe(marge, hugo).
madreDe(marge, lisa).
madreDe(marge, maggie).
madreDe(selma, ling).


%tieneHijo/1

tieneHijo(Personaje) :-
    padreDe(Personaje,_).
tieneHijo(Personaje) :-
    madreDe(Personaje,_).

%compartenProgenitores

compartenPadre(Hijo1, Hijo2) :-
    padreDe(Padre, Hijo1),
    padreDe(Padre, Hijo2).

compartenMadre(Hijo1, Hijo2) :-
    madreDe(Madre, Hijo1),
    madreDe(Madre, Hijo2).

%hermanos/2    

hermanos(Hijo1, Hijo2) :-
    compartenMadre(Hijo1, Hijo2),
    compartenPadre(Hijo1, Hijo2),
    Hijo1 \= Hijo2.

%medioHermanos/2

medioHermanos(Hijo1, Hijo2) :-
    compartenMadre(Hijo1, Hijo2),
    not(compartenPadre(Hijo1, Hijo2)).

medioHermanos(Hijo1, Hijo2) :-
    compartenPadre(Hijo1, Hijo2),
    not(compartenMadre(Hijo1, Hijo2)).

%tioDe/2
%indifirente Tio de Tia en los primeros 2 ejs

tioDe(Tio, Sobrino) :-
    hermanos(Tio, Hermano),
    padreDe(Hermano, Sobrino).
tioDe(Tio, Sobrino) :-
    hermanos(Tio, Hermana),
    madreDe(Hermana, Sobrino).

%busco por pareja del que se consulta
tioDe(Tio, Sobrino) :-
    suPareja(Tio, Pareja),
    madreDe(Pareja, Sobrino).
tioDe(Tio, Sobrino) :-
    suPareja(Tio, Pareja),
    padreDe(Pareja, Sobrino).

%suPareja/2

suPareja(Madre, Padre) :-
    madreDe(Madre, Hijo),
    padreDe(Padre, Hijo).
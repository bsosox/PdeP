%jockey(Nombre, Altura, Peso).
jockey(valdivieso, 155, 52).
jockey(leguisamo, 161, 49).
jockey(lezcano, 149, 50).
jockey(bartucci, 153, 55).
jockey(falero, 157, 52).

%representa(Caballo, Stud).
representa(valdivieso, elTute).
representa(falero, elTute).
representa(lezcano, lasHormigas).
representa(bartucci, elCharabon).
representa(leguisamo, elCharabon).

%caballo(Caballo).
caballo(botafogo).
caballo(oldMan).
caballo(energica).
caballo(matBoy).
caballo(yatasto).

%prefiere(Caballo, Jockey).
prefiere(botafogo, bartucci).
prefiere(botafogo, Jockey):-
    jockey(Jockey,_, Peso),
    Peso < 52.
prefiere(oldMan, Jockey):-
    atom_length(Jockey, Long),
    Long > 7.
prefiere(energica,Jockey):-
    not(prefiere(botafogo,Jockey)).
prefiere(matBoy, Jockey):-
    jockey(Jockey, Altura, _),
    Altura > 170.

gano(botafogo, granPremioNacional).
gano(botafogo, granPremioRepublica).
gano(oldMan, granPremioRepublica).
gano(oldMan, campeonatoPalermoDeOro).
gano(matBoy, granPremioCriadores).

%Punto 2

prefiereMasDeUno(Caballo):-
    caballo(Caballo),
    prefiere(Caballo, Jockey1),
    prefiere(Caballo, Jockey2),
    Jockey1 \= Jockey2.

%Punto 3

noSeLlamaAmor(Caballo, Stud):-
    caballo(Caballo),
    representa(_, Stud),
    not(prefiere(Caballo, Jockey), representa(Jockey, Stud)).
   

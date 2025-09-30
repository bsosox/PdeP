paisContinente(americaDelSur, argentina).
paisContinente(americaDelSur, bolivia).
paisContinente(americaDelSur, brasil).
paisContinente(americaDelSur, chile).
paisContinente(americaDelSur, ecuador).
paisContinente(europa, alemania).
paisContinente(europa, espania).
paisContinente(europa, francia).
paisContinente(europa, inglaterra).
paisContinente(asia, aral).
paisContinente(asia, china).
paisContinente(asia, india).
paisContinente(asia, afganistan).
paisContinente(asia, nepal).

paisImportante(argentina).
paisImportante(alemania).

limitrofes(argentina, brasil).
limitrofes(bolivia, brasil).
limitrofes(bolivia, argentina).
limitrofes(argentina, chile).
limitrofes(espania, francia).
limitrofes(alemania, francia).
limitrofes(nepal, india).
limitrofes(china, india).
limitrofes(nepal, china).
limitrofes(afganistan, china).

ocupa(argentina, azul).
ocupa(bolivia, rojo).
ocupa(brasil, verde).
ocupa(chile, negro).
ocupa(ecuador, rojo).
ocupa(alemania, azul).
ocupa(espania, azul).
ocupa(francia, azul).
ocupa(inglaterra, azul).
ocupa(aral, verde).
ocupa(china, negro).
ocupa(india, verde).
ocupa(afganistan, verde).

continente(americaDelSur).
continente(europa).
continente(asia).

jugador(Jugador):-
    ocupa(_, Jugador).

estaEnContinente(Jugador, Continente):-
    jugador(Jugador),
    paisContinente(Continente,Pais),
    ocupa(Pais, Jugador).

ocupaContinente(Jugador, Continente):-
    jugador(Jugador),
    forall(paisContinente(Continente, Pais), ocupa(Pais, Jugador)).

cubaLibre(Pais):-
    paisContinente(_, Pais),
    not(ocupa(Pais, _)).

leFaltaMucho(Jugador, Continente):-
    estaEnContinente(Jugador, Continente),
    noOcupaPaisDe(Continente, Pais1, Jugador),
    noOcupaPaisDe(Continente, Pais2, Jugador),
    Pais1 \= Pais2.

noOcupaPaisDe(Continente, Pais, Jugador):-
    paisContinente(Continente, Pais),
    not(ocupa(Pais, Jugador)).
    
sonLimitrofes(Pais1, Pais2):-
    limitrofes(Pais1, Pais2).
sonLimitrofes(Pais1, Pais2):-
    limitrofes(Pais2, Pais1).

tipoImportante(Jugador):-
    jugador(Jugador),
    forall(paisImportante(Pais), ocupa(Pais, Jugador)).


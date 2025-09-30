recorrido(17, gba(sur), mitre).
recorrido(24, gba(sur), belgrano).
recorrido(247, gba(sur), onsari).
recorrido(60, gba(norte), maipu).
recorrido (152, gba(norte), olivos).
recorrido(17, caba, santaFe).
recorrido(152, caba, santaFe).
recorrido(10, caba, santaFe).
recorrido(160, caba, medrano).
recorrido(24, caba, corrientes).

%Punto 1

combinan(Linea1, Linea2):-
    recorrido(Linea1, _, Calle),
    recorrido(Linea2, _, Calle),
    Calle1 \= Calle2.

%Punto 2

cruzaGralPaz(Linea):-
    recorrido(Linea, caba, _),
    recorrido(Linea, gba(_), _).

perteneceA(caba, caba).
perteneceA(gba(_), buenosAires).

jurisdiccion(Linea, nacional):-
    cruzaGralPaz(Linea).
jurisdiccion(Linea, provincial(Provincia)):-
    recorrido(Linea, Zona,_),
    perteneceA(Zona, Provincia),
    not(cruzaGralPaz(Linea)).

%Punto 3

cuantasLineasPasan(Calle, Zona, Cantidad):-
    recorrido(_, Zona, Calle),
    findall(Calle, recorrido(_, Zona, Calle), Calles),
    length(Calles, Cantidad).

calleMasTransitada(Calle, Zona):-
    cuantasLineasPasan(Calle, Zona, Cantidad),
    forall((recorrido(_, Zona, OtraCalle), Calle \= OtraCalle), (cuantasLineasPasan(OtraCalle, Zona, CantidadMenor), Cantidad > CantidadMenor)).

duenio(andy, woody, 8).
duenio(sam, jessie, 3).



% deTrapo(tematica).
% deAccion(tematica, partes).
% miniFiguras(tematica, cantidadDeFiguras)
% caraDePapa(partes)

juguete(woody, deTrapo(vaquero)).
juguete(jessie, deTrapo(vaquero)).
juguete(buzz, deAccion(espacial, [original(casco)])).
juguete(soldados, miniFiguras(soldado, 60)).
juguete(monitosEnBarril, miniFiguras(mono, 50)).
juguete(senorCaraDePapa, caraDePapa([original(pieIzquierdo), original(pieDerecho), repuesto(nariz)])).

esRaro(deAccion(stacyMalibu, 1, [sombrero])).

esColeccionista(sam).

%Punto 1

tematica(Juguete, Tematica):-
    juguete(Juguete, Tipo),
    tematicaJuguete(Tipo, Tematica).

tematicaJuguete(deTrapo(Tematica), Tematica).
tematicaJuguete(deAccion(Tematica,_), Tematica).
tematicaJuguete(miniFiguras(Tematica,_), Tematica).
tematicaJuguete(caraDePapa(_), caraDePapa).

esDePlastico(Juguete):-
    juguete(Juguete, miniFiguras(_,_)).
esDePlastico(Juguete):-
    juguete(Juguete, caraDePapa(_)).

esDeColeccion(Juguete):-
    juguete(Juguete, deAccion(_,_)),
    esRaro(Juguete).
esDeColeccion(Juguete):-
    juguete(Juguete, caraDePapa(_)),
    esRaro(Juguete).
esDeColeccion(Juguete):-
    juguete(Juguete, deTrapo(_)).

%Punto 2

amigoFiel(Duenio, NombreJuguete):-
    duenio(Duenio, NombreJuguete, Anios),
    juguete(NombreJuguete,_),
    not(esDePlastico(NombreJuguete)),
    forall(duenio(Duenio,NombreJuguete, Anio), (duenio(Duenio, OtroJuguete, OtroAnio), NombreJuguete \= OtroJuguete, Anio > OtroAnio)).    
    

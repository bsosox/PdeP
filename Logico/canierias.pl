%puntajes(Competidor, Saltos).

puntajes(hernan,[3,5,8,6,9]).
puntajes(julio,[9,7,3,9,10,2]).
puntajes(ruben,[3,5,3,8,3]).
puntajes(roque,[7,10,10]).

puntajeCompetidorEnSalto(Competidor, Salto, Puntaje) :-
	puntajes(Competidor, Puntajes),
	nth1(Salto, Puntajes, Puntaje).

estaDescalificado(Competidor) :-
	puntajes(Competidor, Saltos),
	length(Saltos, Len),
	Len > 5.

clasificaFinal(Competidor) :-
	puntajes(Competidor, Puntajes),
	Suma = sumlist(Puntajes),
	Suma >= 28.
clasificaFinal(Competidor) :-
	puntajes(Competidor, Puntajes),
	

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 1) Construir a extensão do predicado «pertence» que verificase um elemento existe dentro de uma lista de elementos

elem(_,[])       :- false.
elem(E,[H|_])    :- E=H, true.
elem(E,[_|T])    :- elem(E,T).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 2) Construir a extensão do predicado «comprimento» que calculao número de elementos existentes numa lista

length_([],0).
length_([H|T],R) :- length_(T,N), R is N+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 3) Construir a extensão do predicado «diferentes» que calculaa quantidade de elementos diferentes existentes numa lista

uniqueCount(Ls,R) :- nub(Ls,S), length_(S,R).

nub([],[]).
nub([H|T],[H|R])  :- deleteAll(H,T,S), nub(S,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 4) Construir a extensão do predicado «apaga1» que apaga a primeira ocorrência de um elemento de uma lista

delete(_,[],[]).
delete(E,[H|T],T)     :- E=H.
delete(E,[H|T],[H|R]) :- delete(E,T,R). 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 5) Construir a extensão do predicado «apagaT»que apaga todas as ocorrências de um dado elemento numa lista

deleteAll(_,[],[]).
deleteAll(E,[H|T],R)     :- E=H, deleteAll(E,T,R).
deleteAll(E,[H|T],[H|R]) :- deleteAll(E,T,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 6) Construir a extensão do predicado «adicionar»que insere um elemento numa lista, sem o repetir

insert(E,[],[E]).
insert(E,[H|T],[H|T]) :- E=H.
insert(E,[H|T],[H|R]) :- insert(E,T,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 7) Construir a extensão do predicado «concatenar», que resulta na concatenação dos elementos da lista L1 com os elementos da lista L2

++([],Y,Y).
++([X|Xs],Ys,[X|R]) :- ++(Xs,Ys,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 8) Construir a extensão do predicado «inverter»que inverte a ordem dos elementos de uma lista

reverse([],[]).
reverse([H|T],R) :- reverse(T,S), ++(S,[H],R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 9) Construir a extensão do predicado «sublista» que determinase uma lista S é uma sublista deoutra listaL

% pred([],_)          :- true.
% pred([X,Xs],[Y,Ys]) :- X=Y, pred(Xs,Ys).
% pred([X,Xs],[Y,Ys]) :- X=\=Y, false.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 10) Construir a extensão de um predicado capaz de encontrar todas as possibilidades de prova de um teorema.
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

:- op( 900,xfy,'::' ).
:- dynamic filho/2.
:- dynamic pai/2.
:- dynamic avo/2.
:- dynamic neto/2.
:- dynamic descendente/3.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Utilizando a linguagem de programação em lógica PROLOG, e para um sistema de representação de conhecimento e de raciocínio onde estão presentes os predicados:

% filho: Filho, Pai -> { V, F }
% pai: 	Pai, Filho 	-> { V, F }
% neto: Neto, Avô 	-> { V, F }
% avô: Avô, Neto 	-> { V, F }
% descendente: Descendente, Ascendente, Grau -> { V, F }

% entre outros, pretende-se que desenvolva os invariantes que descrevam os significados que se enunciam de seguida: 

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 1) Não pode existir mais do que uma ocorrência da mesma evidência na relação filho/2

+filho(F,P) ::
	( findall((F,P),filho(F,P),L1)
	, sort(L1,L2)
	, length(L1,K)
	, length(L2,K)
	).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 2) Não pode existir mais do que uma ocorrência da mesma evidência na relação pai/2

+pai(P,F) ::
	( findall((P,F),pai(P,F),L1)
	, sort(L1,L2)
	, length(L1,K)
	, length(L2,K)
	).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 3) Não pode existir mais do que uma ocorrência da mesma evidência na relação neto/2

+neto(N,A) ::
	( findall((N,A),neto(N,A),L1)
	, sort(L1,L2)
	, length(L1,K)
	, length(L2,K)
	).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 4) Não pode existir mais do que uma ocorrência da mesma evidência na relação avô/2

+avo(A,N) ::
	( findall((A,N),avo(A,N),L1)
	, sort(L1,L2)
	, length(L1,K)
	, length(L2,K)
	).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 5) Não pode existir mais do que uma ocorrência da mesma evidência na relação descendente/3

+descendente(_,_,_) ::
	( findall((D,A),descendente(D,A,_),L1)
	, sort(L1,L2)
	, length(L1,K)
	, length(L2,K)
	).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 6) Não podem existir mais do que 2 progenitores para um dado indivíduo, na relação filho/2

+filho(F,_) ::
	( findall(P,filho(F,P),L)
	, length(L,R)
	, R=<2
	).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 7) Não podem existir mais do que 2 progenitores para um dado indivíduo, na relação pai/2

+pai(_,F) ::
	( findall(P,pai(P,F),L)
	, length(L,R)
	, R=<2
	).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 8) Não podem existir mais do que 4 indivíduos identificados como avô na relação neto/2

+neto(N,_) ::
	( findall(A,neto(N,A),L)
	, length(L,R)
	, R=<4
	).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 9) Não podem existir mais do que 4 indivíduos identificados como avô na relação avô/2

+avo(_,N) ::
	( findall(A,avo(A,N),L)
	, length(L,R)
	, R=<4
	).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 10) A identificação do grau de descendência na relação descendente/3 deverá pertencer ao conjunto dos números naturais N. 

isNat(N) :- integer(N), N>0.
mapList(_,[]).
mapList(P,[H|T])
	:- 	call(P,H)
	, 	mapList(P,T).

+descendente(_,_,G) :: 
	( findall(G,descendente(_,_,G),L)
	, mapList(isNat,L)
	).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% N  = { 1, 2, 3, 4, ... }					Conjunto dos números naturais
% N0 = { 0, 1, 2, 3, 4, ...}				Conjunto dos números naturais, incluindo o 0 (zero)
% Z  = { ..., -3, -2, -1, 0, 1, 2, 3, ...}	Conjunto dos números inteiros

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

teste([]).
teste([H|T]) :- H, teste(T).

insere(T) :- assert(T).
insere(T) :- retract(T),!,fail. 

evolucao(Termo)
	:-	findall(Inv,+Termo::Inv,L)
	,	insere(Termo)
	,	teste(L).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao(Questao) :- Questao, !, fail.
nao(Questao).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}

demo(Questao,verdadeiro)   :-  Questao.
demo(Questao,falso)		   :- -Questao.
demo(Questao,desconhecido) :- nao( Questao)
						   ,  nao(-Questao).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 1) Construa a extensão de um predicado capaz de caracterizar os números pares

par(0).
par(X) :-
	N is X-2,
	N >= 0,
	par(N).
-par(X) :- nao(par(X)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 2) Construa a extensão de um predicado capaz de caracterizar os números ímpares

impar(1).
impar(X) :-
	N is X-2,
	N >= 1,
	impar(N).
-impar(X) :- nao(impar(X)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 3) Construa a extensão de um predicado que caracterize o conjunto dos números naturais(N)

isNat(1).
isNat(X) :-
	N is X-1,
	N >=1,
	isNat(N).
-isNat(X) :- nao(isNat(X)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 4) Construa a extensão de um predicado que caracterize o conjunto dos números inteiros(Z)

isInt(0).
isInt(X) :-
	X>0, N is X-1, N>=0, isInt(N);
	X<0, N is X+1, N=<0, isInt(N).
-isInt(X) :- nao(isInt(X)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 5) Construa a extensão de um predicado capaz de caracterizar as cores do arco-íris

arcoiris(vermelho).
arcoiris(laranja).
arcoiris(amarelo).
arcoiris(verde).
arcoiris(azul).
arcoiris(anil).
arcoiris(violeta).
-arcoiris(X) :- nao(arcoiris(X)). % como as cores do arco-íris são só aquelas 7, não fazia sentido existirem cores 'desconhecidas'

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 6) Construa a extensão de um predicado com capacidade para identificar as cores dos equipamentos,oficial e alternativos,do Vitória



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 7) Construa um programa capaz de representar a autorização de atravessar a estrada baseado na não existência de automóveis em aproximação, e, ainda, a autorização de atravessar o caminho de ferro pela confirmaçãoda inexistência de um comboio em aproximação



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 8) Tendo em consideração o grafo ilustrado na Figura 1, desenvolva um programa com a capacidade para definir o significado de «nodo terminal», baseado na descrição de grafospela definição de nodos e de arcos.
% Deverá ser desenvolvido, ainda, o sistema de inferência, na forma de um meta-predicado, capaz de dar corpo ao mecanismo de raciocínio subjacente ao contexto desta extensão à programação em lógica.






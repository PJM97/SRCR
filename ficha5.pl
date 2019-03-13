%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic filho/2.
:- dynamic pai/2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F,D}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).

% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido

+filho( F,P ) :: ( findall( (F,P),(filho( F,P )),S )
				 , length( S,N )
				 , N == 1
				 ).

% Invariante Referencial: nao admitir mais do que 2 progenitores
%                         para um mesmo individuo

+filho( F,P ) :: ( findall( PS, filho(F,PS), S )
				 , length(S,N)
				 , N=<2
                 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a evolucao do conhecimento

evolucao( Termo ) :- findall(I, +Termo :: I, Linv)
				   , insercao(Termo)
				   , teste(Linv).

insercao(T) :- assert(T).
insercao(T) :- retract(T),!, fail.

teste([]).
teste([I|L]):- I, teste(L).


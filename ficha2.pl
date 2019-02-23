%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacao genealogica.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% 1)
+(V1,V2,R) 			:- R is V1+V2.

% 2)
+(V1,V2,V3,R)		:- R is V1+V2+V3.

% 3)
sum(L,R)			:- foldl(+,L,0,R).

% sem folds:
sum_([],0).
sum_([H|T],R) 		:- sum_(T,S), R is H+S.

% 4)
$(Func,V1,V2,R) 	:- call(Func,V1,V2,R).
app(Func,V1,V2,R)	:- call(Func,V1,V2,R).

-(V1,V2,R)			:- R is V1-V2.
*(V1,V2,R)			:- R is V1*V2.
/(V1,V2,R)			:- R is V1/V2.

% 5)
foldl(Func,List,V0,R) 	:- foldl_(List,Func,V0,R).
foldl_([],_,V,V).
foldl_([H|T],Func,V0,V) :- call(Func,H,V0,V1),foldl_(T,Func,V1,V).

% 6)
max(V1,V2,R) 		:- V1>V2, R is V1.
max(V1,V2,R) 		:- R is V2.

% 7)
max(V1,V2,V3,R) 	:- V1>V2, max(V1,V3,R).
max(V1,V2,V3,R)	 	:- max(V2,V3,R).

% 8)
maximum([H|T],R)	:- foldl(max,T,H,R).

%  sem folds:
maximum_([X],X).
maximum_([H|T],R)	:- max_(T,Max), max(H,Max,M), R is M.

% 9)
min(V1,V2,R) 		:- V1<V2, R is V1.
min(V1,V2,R)		:- R is V2.

% 10)
min(V1,V2,V3,R)		:- V1>V2, min(V2,V3,R).
min(V1,V2,V3,R)		:- min(V1,V3,R).

% 11)
minimum([H|T],R)	:- foldl(min,T,H,R).

%  sem folds:
minimum_([X],X).
minimum_([H|T],R) 	:- minimum_(T,M), min(H,M,Min), R is Min.

% 12)
avg(Xs,R)			:- sum(Xs,S), length(Xs,L), R is (S/L).
% length_([],0).
% length_([H|T],R)	:- length_(T,N), R is N+1.

% 13)

partition_(_,[],[],[]).
partition_(P,[H|T],[H|B],S) :- P>=H, partition_(P,T,B,S).
partition_(P,[H|T],B,[H|S])	:- partition_(P,T,B,S).

% [13_v1]:
qs1(Ls,R) :- qs_(Ls,R,[]).
qs1_([],R,R).
qs1_([H|T],Ss,R) :- partition_(H,T,Smalls,Bigs)
				 ,	qs1_(Bigs,RBs,R)
				 ,	qs1_(Smalls,Ss,[H|RBs]).

% [13_v2]: (mais fácil de ler)

++([],Y,Y).
++([X|Xs],Ys,[X|R]) :- ++(Xs,Ys,R).

qs([],[]).
qs([H|T],R) :- 	partition_(H,T,S,B)
			,	qs(B,Bs)
			,	qs(S,Ss)
			,	++(Ss,[H|Bs],R).



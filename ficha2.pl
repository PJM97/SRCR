%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 1) Construir a extensão de um predicado que calcule a soma de dois valores
+(V1,V2,R)          :- R is V1+V2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 2) Construir a extensão de um predicado que calcule a soma de três valores
+(V1,V2,V3,R)       :- R is V1+V2+V3.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 3) Construir a extensão de um predicado que calcule a soma de um conjunto de valores
sum(L,R)            :- foldl(+,L,0,R).

% sem folds:
sum_([],0).
sum_([H|T],R)       :- sum_(T,S), R is H+S.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 4) Construir a extensão de um predicado que aplique uma operação aritmética (adição, subtração, multiplicação ou divisão) a dois valores
$(Func,V1,V2,R)     :- call(Func,V1,V2,R).
app(Func,V1,V2,R)   :- call(Func,V1,V2,R).

-(V1,V2,R)          :- R is V1-V2.
*(V1,V2,R)          :- R is V1*V2.
/(V1,V2,R)          :- R is V1/V2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 5) Construir a extensão de um predicado que aplique uma operação aritmética (adição ou multiplicação) a um conjunto de valores
foldl(Func,List,V0,R)   :- foldl_(List,Func,V0,R).
foldl_([],_,V,V).
foldl_([H|T],Func,V0,V) :- call(Func,H,V0,V1),foldl_(T,Func,V1,V).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 6) Construir a extensão de um predicado que calcule o maior valor entre dois valores
max(V1,V2,R)        :- V1>V2, R is V1.
max(V1,V2,R)        :- R is V2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 7) Construir a extensão de um predicado que calcule o maior valor entre três valores
max(V1,V2,V3,R)     :- V1>V2, max(V1,V3,R).
max(V1,V2,V3,R)     :- max(V2,V3,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 8) Construir a extensão de um predicado que calcule o maior de um conjunto de valores
maximum([H|T],R)    :- foldl(max,T,H,R).

%  sem folds:
maximum_([X],X).
maximum_([H|T],R)   :- max_(T,Max), max(H,Max,M), R is M.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 9) Construir a extensão de um predicado que calcule o menor valor entre dois valores
min(V1,V2,R)        :- V1<V2, R is V1.
min(V1,V2,R)        :- R is V2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 10) Construir a extensão de um predicado que calcule o menor valor entre três valores
min(V1,V2,V3,R)     :- V1>V2, min(V2,V3,R).
min(V1,V2,V3,R)     :- min(V1,V3,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 11) Construir a extensão de um predicado que calcule o menor de um conjunto de valores
minimum([H|T],R)    :- foldl(min,T,H,R).

%  sem folds:
minimum_([X],X).
minimum_([H|T],R)   :- minimum_(T,M), min(H,M,Min), R is Min.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 12) Construir a extensão de um predicado que calcule a média aritmética de um conjunto de valores
avg(Xs,R)           :- sum(Xs,S), length(Xs,L), R is (S/L).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 13) Construir a extensão de um predicado que ordene de modo crescente uma sequência de valores
partition_(_,[],[],[]).
partition_(P,[H|T],[H|B],S) :- P>=H, partition_(P,T,B,S).
partition_(P,[H|T],B,[H|S]) :- partition_(P,T,B,S).


% [13_v1]:
qs1(Ls,R) :- qs_(Ls,R,[]).
qs_([],R,R).
qs_([H|T],Ss,R) :- partition_(H,T,Smalls,Bigs)
                ,  qs_(Bigs,RBs,R)
                ,  qs_(Smalls,Ss,[H|RBs]).


% [13_v2]: (mais fácil de ler)
++([],Y,Y).
++([X|Xs],Ys,[X|R]) :- ++(Xs,Ys,R).

qs([],[]).
qs([H|T],R) :-  partition_(H,T,S,B)
            ,   qs(B,Bs)
            ,   qs(S,Ss)
            ,   ++(Ss,[H|Bs],R).


% [13_v3]:
qsCre(Ls,R) :-  qsortBy(>,Ls,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 14) Construir a extensão de um predicado que ordene de modo decrescente uma sequência de valores
qsDec(Ls,R) :-  qsortBy(<,Ls,R).

qsortBy(_,[],[]).
qsortBy(Func,[H|T],R) :- partitionBy_(Func,H,T,S,B)
                      ,  qsortBy(Func,B,Bs)
                      ,  qsortBy(Func,S,Ss)
                      ,  ++(Ss,[H|Bs],R).

partitionBy_(F,P,[],[],[]).
partitionBy_(F,P,[H|T],[H|B],S) :- call(F,P,H), partitionBy_(F,P,T,B,S).
partitionBy_(F,P,[H|T],B,[H|S]) :- partitionBy_(F,P,T,B,S).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 15) Construir a extensão de um predicado que calcule a quantidade de conjuntos vazios existentes num dado conjunto de ocorrências
countEmptys([],0).
countEmptys([[]|T],R) :- countEmptys(T,N), R is N+1.
countEmptys([_|T],R)  :- countEmptys(T,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 16) Construir a extensão de um predicado que calcule o valor de verdade contrário à resposta a uma questão

% [nao] -> solução das aulas teóricas
nao(T) :- T,!,fail.
nao(T).

% not(P) :- call(P) -> false; true.



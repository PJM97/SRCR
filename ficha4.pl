%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 1) Construa a extensão de um predicado capaz de caracterizar os números pares

isEven(X) :- X mod 2 =:= 0.

isEven2(2).
isEven2(X) :- Y is X-2, Y>=2, isEven2(Y).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 2) Construa a extensão de um predicado capaz de caracterizar os números ímpares

isOdd(X) :- \+(isEven(X)).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 3) Construa a extensão de um predicado que caracterize o conjunto dos números naturais

isNat(1).
isNat(X) :- X>1, Y is (X-1), isNat(Y).

isNat2(X) :- X>=1, integer(X).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 4) Construa a extensão de um predicado que caracterize o conjunto dos números inteiros

isInt(0).
isInt(X) :- isNat(X); isNat(-1*X).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 5) Construa a extensão de um predicado que determine os divisores de um número natural

divs(X,R) :- X>0, divs(X,X,[],R).
divs(X,1,L,[1|L]).
divs(X,Y,L,[Y|R]) :- X mod Y =:= 0,
                     Z is Y-1,
                     divs(X,Z,L,R).
divs(X,Y,L,R) :- Z is Y-1, divs(X,Z,L,R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 6) Construa a extensão de um predicado que verifica se um número natural é primo

% isPrime(2).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 7) O cálculo do máximo divisor comum (m.d.c.) pode ser obtido pelos seguintes passos:
%   se existirem dois números diferentes, trocar o valor do maior pela sua diferença ao menor e iterar o cálculo;
%   quando os valores forem iguais, esse é o valor do máximo divisor comum (m.d.c.) e o cálculo está terminado;
%   Desenvolva a extensão de umpredicado que calcule o m.d.c. entre 2 números naturais



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 8) O valor do mínimo múltiplo comum entre dois valores pode ser obtido através aos seguintes passos:
%   sendo dados dois números, identificar o maior e o menor, e iniciar o cálculo do mínimo múltiplo comum com o valor do maior;
%   se o valor do mínimo múltiplo comum não for divisível pelo menor, somar o valor do maior ao valor atual do mínimo múltiplo comum e iterar o processo;
%   se o valor do mínimo múltiplo comum for divisível pelo menor, está encontrada a solução do problema;
%   Desenvolva a extensão de um predicado que calcule o m.m.c. entre 2 números naturais



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% 9) Uma sequência de Fibonacci é definida por:{f[0]=0; f[1]=1; f[n]=f[n−2]+f[n−1]}
%   Desenvolva a extensão de um predicado que, dado o índice de fibonacci permita identificar o respetivo número da sequênciade fibonacci

fib(0,0).
fib(1,1).
fib(X,R) :- A is X-2,
            B is X-1,
            fib(A,R1),
            fib(B,R2),
            R is R1+R2.



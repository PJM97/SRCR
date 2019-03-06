%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Construa a extensão de um predicado capaz de caracterizar os números pares



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Construa a extensão de um predicado capaz de caracterizar os números ímpares



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Construa a extensão de um predicado que caracterize o conjunto dos números naturais



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Construa a extensão de um predicado que caracterize o conjunto dos números inteiros



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Construa a extensão de um predicado que determine os divisores de um número natural



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Construa a extensão de um predicado que verifica se um número natural é primo



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% O cálculo do máximo divisor comum (m.d.c.) pode ser obtido pelos seguintes passos:
%   se existirem dois números diferentes, trocar o valor do maior pela sua diferença ao menor e iterar o cálculo;
%   quando os valores forem iguais, esse é o valor do máximo divisor comum (m.d.c.) e o cálculo está terminado;
%   Desenvolva a extensão de umpredicado que calcule o m.d.c. entre 2 números naturais



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% O valor do mínimo múltiplo comumentre dois valorespode ser obtido através aos seguintes passos:
%   sendo dados dois números, identificar o maior e o menor, e iniciar o cálculo do mínimo múltiplo comum com o valor do maior;
%   se o valor do mínimo múltiplo comum não for divisível pelo menor, somar o valor do maior ao valor atual do mínimo múltiplo comum e iterar o processo;
%   se o valor do mínimo múltiplo comum for divisível pelo menor, está encontrada a solução do problema;
%   Desenvolva a extensão de um predicado que calcule o m.m.c. entre 2 números naturais



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Uma sequência de Fibonacci é definida por:{f[0]=0; f[1]=1; f[n]=f[n−2]+f[n−1]}
%   Desenvolva a extensão de um predicado que, dado o índice de fibonacci permita identificar o respetivo número da sequênciade fibonacci




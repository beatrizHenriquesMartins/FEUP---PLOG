/**********
 tabuleiros
**********/

tabuleiro(6,
[[-1,0,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,6,0],
 [0,6,0,0,0,0], [0,0,0,0,0,0], [0,0,0,0,0,-1]]).

tabuleiro(9,
[[0,0,0,3,0,0,0,0,0], [0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,1,0,0],
 [0,0,0,-1,0,0,0,0,0], [0,0,0,0,0,0,0,0,0], [0,0,0,0,0,-1,0,0,0],
 [0,0,5,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0], [0,0,0,0,0,2,0,0,0]]).

% tablueiro(TAMANHO,LINHA,CASAS_COBRA_LINHA)
tabuleiroLinha(6,2,2).
tabuleiroLinha(6,5,1).

% tablueiro(TAMANHO,COLUNA,CASAS_COBRA_LINHA)
tabuleiroColuna(9,3,6).
tabuleiroColuna(9,7,4).
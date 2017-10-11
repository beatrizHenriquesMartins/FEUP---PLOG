/* Nomenclatura das peças
        __________|_Peças Brancas_|_Peças Pretas_
        Rei      |      k        |      kk     |
        Rainha   |      q        |      qq     |
        Torre 1  |      t1       |      tt1    |
        Torre 2  |      t2       |      tt2    | 
        Bispo 1  |      b1       |      bb1    | 
        Bispo 2  |      b2       |      bb1    |
        Cavalo 1 |      c1       |      cc1    |
        Cavalo 2 |      c2       |      cc2    |

Outras nomenclaturas:
        vazio - casa do tabuleiro vazia.

Representação do Tabuleiro
 ________________________________________________
|     |     |     |     |     |     |     |     |
|  k  |  kk | bb2 |     |     |     |     |     |  1
|_____|_____|_____|_____|_____|_____|_____|_____| 
|     |     |     |     |     |     |     |     |
|     |     |     |     |     |     |     |     |  2
|_____|_____|_____|_____|_____|_____|_____|_____| 
|     |     |     |     |     |     |     |     |
|     |     |     |     |     |     |     |     |  3
|_____|_____|_____|_____|_____|_____|_____|_____| 
|     |     |     |     |     |     |     |     |
|     |     |     |     |     |     |     |     |  4
|_____|_____|_____|_____|_____|_____|_____|_____| 
|     |     |     |     |     |     |     |     |
|     |     |     |     |     |     |     |     |  5
|_____|_____|_____|_____|_____|_____|_____|_____| 
|     |     |     |     |     |     |     |     |
|     |     |     |     |     |     |     |     |  6
|_____|_____|_____|_____|_____|_____|_____|_____| 
|     |     |     |     |     |     |     |     |
|     |     |     |     |     |     |     |     |  7
|_____|_____|_____|_____|_____|_____|_____|_____| 
|     |     |     |     |     |     |     |     |
|     |     |     |     |     |     |     |     |  8
|_____|_____|_____|_____|_____|_____|_____|_____| 
   a     b     c     d     e     f     g     h

*/

inicializarTabuleiro(
[
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[k , t2 , b2 , c2 , cc2, bb2 , tt2 , kk],
[q , t1 , b1 , c1 , cc1, bb1 , tt1 , qq]
]).

% Imprime as letras que permitem identificar uma coluna do tabuleiro
impimirIdentificadoresColunas:-
        write('   a     b     c     d     e     f     g     h').

% Lista com os números que permitem identificar uma linha do tabuleiro
numeroLinhas(['8','7','6','5','4','3','2','1']).

% Imprime o limite superior do tabuleiro
imprimirSeparadorInicial:-
        write(' _______________________________________________').

% Imprime o separador das linhas do tabuleiro
imprimirSeparadorLinhas:-
        write('|_____|_____|_____|_____|_____|_____|_____|_____|  ').

% Imprime o separador das colunas do tabuleiro
imprimirSeparadorColunas:-
        write('|     |     |     |     |     |     |     |     |').

% Imprime uma casa do tabuleira com a peca Peca
imprimeCasa(Peca, L):-
        L = 1, write('  '), write(Peca), write('  ').
imprimeCasa(Peca, L):-
        L = 2, write('  '), write(Peca), write(' ').
imprimeCasa(Peca, L):-
        L = 3, write(' '), write(Peca), write(' ').        
imprimeCasa(_, _):-
        write('     ').
        
% Imprime as peças que estão numa determinada linha do tabuleiro
imprimirPecasLinha([]).
imprimirPecasLinha([H | T]):- 
        atom_length(H, L), write('|'),
        imprimeCasa(H, L),
        imprimirPecasLinha(T).

imprimirLinha([] , []).
imprimirLinha(Linha , NLinha):-
        imprimirSeparadorColunas, nl,
        imprimirPecasLinha(Linha), write('|   '), write(NLinha), nl,
        imprimirSeparadorLinhas, nl.

imprimirLinhas([],[]). 
imprimirLinhas([Linha | T], [NLinha | ListaLinhas]):- 
                imprimirLinha(Linha, NLinha), 
                imprimirLinhas(T, ListaLinhas).

imprimirTabuleiro([H | T]):-
        imprimirSeparadorInicial , nl,
        numeroLinhas(ListaLinhas),
        imprimirLinhas([H | T], ListaLinhas), nl,
        impimirIdentificadoresColunas, nl. 

começarCorridaReis:-
        inicializarTabuleiro(T), imprimirTabuleiro(T).
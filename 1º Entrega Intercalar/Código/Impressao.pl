/* 
Nomenclatura das peças
        _________|_Peças_Pretas_|_Peças_Brancas|
        Rei      |      k1       |      k2     |
        Rainha   |      q1       |      q2     |
        Torre 1  |      t1       |      t2     |
        Torre 2  |      t1       |      t2     | 
        Bispo 1  |      b1       |      b2     | 
        Bispo 2  |      b1       |      b2     |
        Cavalo 1 |      c1       |      c2     |
        Cavalo 2 |      c1       |      c2     |

Outras nomenclaturas:
        vazio - casa do tabuleiro vazia.

Representação do Tabuleiro
 ________________________________________________
|     |     |     |     |     |     |     |     |
|     |     |     |     |     |     |     |     |  1
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

____________________
|_Pecas_Capturadas_|

@Jogador Branco
k1, q1, t1, t1, b1, b1, c1, c1

@Jogador Preto
k2, q2, t2, t2, b2, b2, c2, c2 

*/

% pecasCapturadas(JogadorID, [ListaPecasCapturadas])
pecasCapturadas(branco,[q1, t1, t1, b1, b1, c1]).
pecasCapturadas(preto,[t2, b2, c2, c2]).

% Inicializa o tabuleiro com as peças na casa correta
inicializarTabuleiro(
[
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[vazio,vazio,vazio,vazio,vazio,vazio,vazio,vazio],
[k1 , t1 , b1 , c1 , c2, b2 , t2 , k2],
[q1 , t1 , b1 , c1 , c2, b2 , t2 , q2]
]).

% Imprime as letras que permitem identificar uma coluna do tabuleiro
impimirIdentificadoresColunas:-
        write('   a     b     c     d     e     f     g     h').

% Lista com os numeros que permitem identificar uma linha do tabuleiro
numeroLinhas(['8','7','6','5','4','3','2','1']).

% Imprime o limite superior do tabuleiro
imprimirSeparadorInicial:-
        write(' _______________________________________________').

% Imprime o separador de linhas do tabuleiro
imprimirSeparadorLinhas:-
        write('|_____|_____|_____|_____|_____|_____|_____|_____|  ').

% Imprime o separador de colunas do tabuleiro
imprimirSeparadorColunas:-
        write('|     |     |     |     |     |     |     |     |').

% Imprime uma casa do tabuleiro com a peca "Peca"
imprimeCasa(Peca, L):-
        L = 2, write('  '), write(Peca), write(' ').      
imprimeCasa(_, _):-
        write('     ').
        
% Imprime as pecas que estao numa determinada linha do tabuleiro
imprimirPecasLinha([]).
imprimirPecasLinha([H | T]):- 
        atom_length(H, L), write('|'),
        imprimeCasa(H, L),
        imprimirPecasLinha(T).

% Imprime a linha numero "NLinha" do tabuleiro
imprimirLinha([] , []).
imprimirLinha(Linha , NLinha):-
        imprimirSeparadorColunas, nl,
        imprimirPecasLinha(Linha), write('|   '), write(NLinha), nl,
        imprimirSeparadorLinhas, nl.

% Imprime todas as linhas do tabuleiro
imprimirLinhas([],[]). 
imprimirLinhas([Linha | T], [NLinha | ListaLinhas]):- 
        imprimirLinha(Linha, NLinha), 
        imprimirLinhas(T, ListaLinhas).

% Imprime as pecas capturadas por cada um dos jogadores
imprimirListaPecasCapturadas([]).
imprimirListaPecasCapturadas([H | T]):-
        write(H), write(' '),
        imprimirListaPecasCapturadas(T).

% Imprime uma lista de pecas capturadas pelo jogador "Jogador"
imprimirListaPecasCapturadas(Jogador, ListaPecas):-
        write('- Jogador '), write(Jogador), nl,
        imprimirListaPecasCapturadas(ListaPecas).

% Imprime as pecas capturadas pelos dois jogadores
imprimirPecasCapturadas:-
        pecasCapturadas(branco, Lista1),
        pecasCapturadas(preto, Lista2), nl,
        write(' __________________'), nl, write('|_Pecas_Capturadas_|'), nl,
        imprimirListaPecasCapturadas(branco, Lista1), nl, nl,
        imprimirListaPecasCapturadas(preto, Lista2).
        
% Imprime o tabuleiro com o estado atual do jogo
imprimirTabuleiro([H | T]):-
        imprimirSeparadorInicial, nl,
        numeroLinhas(ListaLinhas),
        imprimirLinhas([H | T], ListaLinhas), nl,
        impimirIdentificadoresColunas, nl,
        imprimirPecasCapturadas, nl, nl. 

% Inicia o jogo Corrida de Reis
começarCorridaReis:-
        inicializarTabuleiro(T), imprimirTabuleiro(T). 
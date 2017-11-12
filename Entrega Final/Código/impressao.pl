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

****************
* Menu Inicial *
****************
_______________________________________________________ 
|                                                     | 
|                                                     | 
|       ____                   _                      | 
|      |  _ \    __ _    ___  (_)  ____     ____      | 
|      | |_) |  / _` |  / __| | | |  _ \   / _  |     | 
|      |  _ <  | (_| | | (__  | | | | | | | (_| |     | 
|      |_| \_\  \__,_|  \___| |_| |_| |_|  \__, |     | 
|                                          |___/      | 
|           _  __  _                                  | 
|          | |/ / (_)  ____     ____   ___            | 
|          |   /  | | |  _ \   / _  | / __|           | 
|          | . \  | | | | | | | (_| | \__ \           | 
|          |_|\_\ |_| |_| |_|  \__, | |___/           | 
|                              |___/                  | 
|                                                     | 
|                                                     | 
|               Beatriz Henriques                     | 
|                Beatriz Velho                        | 
|               PLOG - FEUP 17/18                     | 
|-----------------------------------------------------| 
|                                                     | 
|                                                     | 
|         1. Start Game Player vs Player              | 
|         2. Start Game PC vs Player                  | 
|         3. Start Game PC vs PC                      | 
|         4. How to play                              | 
|         5. Exit                                     | 
|                                                     | 
|               Choose an option                      | 
|-----------------------------------------------------| 

*****************
* Menu de Ajuda *
*****************
_______________________________________________________
|                                                     |
|                                                     |
|            _   _                 _                  |
|           | | | | _____      __ | |_ ___            |
|           | |_| |/ _ \ \ /\ / / | __/ _ \           |
|           |  _  | (_) \ V  V /  | || (_) |          |
|           |_| |_|\\___/\_/\_/   \__\\___/           |
|                  ____ | | __ _ _   _                |
|                 |  _ \| |/ _` | | | |               |
|                 | |_) | | (_| | |_| |               |
|                 | .__/|_|\__,_|\__, |               |
|                 |_|            |___/                |
|                                                     |
|                                                     |
|                                                     |
|   Objective                                         |
|       The objective of the game is to be the first  |
|     to arrive with the KING at the last line of     |
|     the board.                                      |
|                                                     |
|   Rules                                             |
|       The game is played with the chess rules, but  |
|     you can not use the checkmate.                  |
|       This game has one board, two players (white   |
|     and black). Each player have 1 king, 1 queen,   |
|     2 towers, 2 bishop and 2 horses.                |
|                                                     |
|                    Click on 1                       |
|                                                     |
|-----------------------------------------------------|

*****************
* Menu de Exit *
*****************
_______________________________________________________ 
|                                                     | 
|                                                     | 
|       ____                   _                      | 
|      |  _ \    __ _    ___  (_)  ____     ____      | 
|      | |_) |  / _` |  / __| | | |  _ \   / _  |     | 
|      |  _ <  | (_| | | (__  | | | | | | | (_| |     | 
|      |_| \_\  \__,_|  \___| |_| |_| |_|  \__, |     | 
|                                          |___/      | 
|           _  __  _                                  | 
|          | |/ / (_)  ____     ____   ___            | 
|          |   /  | | |  _ \   / _  | / __|           | 
|          | . \  | | | | | | | (_| | \__ \           | 
|          |_|\_\ |_| |_| |_|  \__, | |___/           | 
|                              |___/                  | 
|                                                     | 
|                                                     | 
|                                                     | 
|             Thanks for playing our game!            | 
|                                                     | 
|                                                     | 
|                                                     | 
|                                                     | 
|                                                     | 
|                                                     | 
|                                                     | 
|                                                     | 
|                                                     | 
|                                                     | 
|                                                     | 
|-----------------------------------------------------|
*/

% pecasCapturadas(JogadorID, [ListaPecasCapturadas])
pecasCapturadas(branco,[q1, t1, t1, b1, b1, c1]).
pecasCapturadas(preto,[t2, b2, c2, c2]).

% Imprime as pecas capturadas por cada um dos jogadores
/*
imprimirListaPecasCapturadas([]).
imprimirListaPecasCapturadas([H | T]):-
        write(H), write(' '),
        imprimirListaPecasCapturadas(T).
*/ 

% Imprime uma lista de pecas capturadas pelo jogador "Jogador"
/*
imprimirListaPecasCapturadas(Jogador, ListaPecas):-
        write('- Jogador '), write(Jogador), nl,
        imprimirListaPecasCapturadas(ListaPecas).
*/

% Imprime as pecas capturadas pelos dois jogadores
/*
imprimirPecasCapturadas:-
        pecasCapturadas(branco, Lista1),
        pecasCapturadas(preto, Lista2), nl,
        write(' __________________'), nl, write('|_Pecas_Capturadas_|'), nl,
        imprimirListaPecasCapturadas(branco, Lista1), nl, nl,
        imprimirListaPecasCapturadas(preto, Lista2).
*/
        
% Imprime as letras que permitem identificar uma coluna do tabuleiro
impimirIdentificadoresColunas:-
        write('   1     2     3     4     5     6     7     8').

% Lista com os numeros que permitem identificar uma linha do tabuleiro
numeroLinhas(['1','2','3','4','5','6','7','8']).

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
imprimirCasa(Peca, 1):-
        write('  '), write(Peca), write('  ').      
imprimirCasa(_, _):-
        write('     ').

% Imprime as pecas que estao numa determinada linha do tabuleiro
imprimirPecasLinha([]).
imprimirPecasLinha([H | T]):- 
        atom_length(H, L), write('|'),
        imprimirCasa(H, L),
        imprimirPecasLinha(T).

% Imprime a linha numero "NLinha" do tabuleiro
imprimirLinha([],[]).

imprimirLinha(Linha,NLinha):-
        imprimirSeparadorColunas, nl,
        imprimirPecasLinha(Linha), write('|   '), write(NLinha), nl,
        imprimirSeparadorLinhas, nl.

% Imprime todas as linhas do tabuleiro
imprimirLinhas([],[]). 

imprimirLinhas([Linha|T],[NLinha|ListaLinhas]):- 
        imprimirLinha(Linha, NLinha), 
        imprimirLinhas(T, ListaLinhas).

% Imprime o tabuleiro com o estado atual do jogo
imprimirTabuleiro(TAB):-
        converterTabuleiro(TAB,[H|T]),
        imprimirSeparadorInicial, nl,
        numeroLinhas(ListaLinhas),
        imprimirLinhas([H|T], ListaLinhas), nl,
        impimirIdentificadoresColunas, nl. 

converterTabuleiro([],[]).

converterTabuleiro([H|T],[TAB2|TAB1]):-
        converterTabuleiro(T,TAB1),
        converterTabuleiroRecurse(H,TAB2).

converterTabuleiroRecurse([],[]).

converterTabuleiroRecurse([H|T],[TAB2|TAB1]):-
        converterTabuleiroRecurse(T,TAB1),
        converterCasa(H,TAB2).

converterCasa({},vazio).

converterCasa({_,_,TIPO,branco},TIPO).

converterCasa({_,_,TIPO,preto},CASA):-
        char_code(TIPO,CODE),
        CODE1 is CODE-32,
        char_code(CASA,CODE1).

% Imprime o menu inicial
imprimirMenuInicial :-
        nl, nl, nl,
        write(' _______________________________________________________ '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |       ____                   _                      | '), nl,
        write(' |      |  _ \\    __ _    ___  (_)  ____     ____      | '), nl,
        write(' |      | |_) |  / _` |  / __| | | |  _ \\   / _  |     | '), nl,
        write(' |      |  _ <  | (_| | | (__  | | | | | | | (_| |     | '), nl,
        write(' |      |_| \\_\\  \\__,_|  \\___| |_| |_| |_|  \\__, |     | '), nl,
        write(' |                                          |___/      | '), nl,
        write(' |           _  __  _                                  | '), nl,
        write(' |          | |/ / (_)  ____     ____   ___            | '), nl,
        write(' |          |   /  | | |  _ \\   / _  | / __|           | '), nl,
        write(' |          |   \\  | | | | | | | (_| | \\__ \\           | '), nl,
        write(' |          |_|\\_\\ |_| |_| |_|  \\__, | |___/           | '), nl,
        write(' |                              |___/                  | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                 Beatriz Henriques                   | '), nl,
        write(' |                   Beatriz Velho                     | '), nl,
        write(' |                 PLOG - FEUP 17/18                   | '), nl,
        write(' |                                                     | '), nl,
        write(' |-----------------------------------------------------| '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |         1. Start Game Player vs Player              | '), nl,
        write(' |         2. Start Game PC vs Player                  | '), nl,
        write(' |         3. Start Game PC vs PC                      | '), nl,
        write(' |         4. How to play                              | '), nl,
        write(' |         5. Exit                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                   Choose an option                  | '), nl,
        write(' |_____________________________________________________| '), nl.

% Imprime o menu de ajuda
imprimirMenuAjuda :-
        write(' _______________________________________________________ '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |            _   _                 _                  | '), nl,
        write(' |           | | | | _____      __ | |_ ___            | '), nl,
        write(' |           | |_| |/ _ \\ \\ /\\ / / | __/ _ \\           | '), nl,
        write(' |           |  _  | (_) \\ V  V /  | || (_) |          | '), nl,
        write(' |           |_| |_|\\___/ \\_/\\_/    \\__\\___/           | '), nl,
        write(' |                  ____ | | __ _ _   _                | '), nl,
        write(' |                 |  _ \\| |/ _` | | | |               | '), nl,
        write(' |                 | |_) | | (_| | |_| |               | '), nl,
        write(' |                 | .__/|_|\\__,_|\\__, |               | '), nl,
        write(' |                 |_|            |___/                | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |   Objective                                         | '), nl,
        write(' |       The objective of the game is to be the first  | '), nl,
        write(' |     to arrive with the KING at the last line of     | '), nl,
        write(' |     the board.                                      | '), nl,
        write(' |                                                     | '), nl,
        write(' |   Rules                                             | '), nl,
        write(' |       The game is played with the chess rules, but  | '), nl,
        write(' |     you can not use the checkmate.                  | '), nl,
        write(' |       This game has one board, two players (white   | '), nl,
        write(' |     and black). Each player have 1 king, 1 queen,   | '), nl,
        write(' |     2 towers, 2 bishop and 2 horses.                | '), nl,
        write(' |                                                     | '), nl,
        write(' |                    Click on 1                       | '), nl,
        write(' |                                                     | '), nl,
        write(' |-----------------------------------------------------| '), nl.

% Imprime menu de saida
imprimirMenuExit :-
        write(' _______________________________________________________ '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |       ____                   _                      | '), nl,
        write(' |      |  _ \\    __ _    ___  (_)  ____     ____      | '), nl,
        write(' |      | |_) |  / _` |  / __| | | |  _ \\   / _  |     | '), nl,
        write(' |      |  _ <  | (_| | | (__  | | | | | | | (_| |     | '), nl,
        write(' |      |_| \\_\\  \\__,_|  \\___| |_| |_| |_|  \\__, |     | '), nl,
        write(' |                                          |___/      | '), nl,
        write(' |           _  __  _                                  | '), nl,
        write(' |          | |/ / (_)  ____     ____   ___            | '), nl,
        write(' |          |   /  | | |  _ \\   / _  | / __|           | '), nl,
        write(' |          | . \\  | | | | | | | (_| | \\__ \\           | '), nl,
        write(' |          |_|\\_\\ |_| |_| |_|  \\__, | |___/           | '), nl,
        write(' |                              |___/                  | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |             Thanks for playing our game!            | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl,
        write(' |-----------------------------------------------------| '), nl,
        nl,
        nl.
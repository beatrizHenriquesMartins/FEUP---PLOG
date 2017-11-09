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
|            _   _                 _                  | 
|           | | | | _____      __ | |_ ___            | 
|           | |_| |/ _ \ \ /\ / / | __/ _ \           | 
|           |  _  | (_) \ V  V /  | || (_) |          |
|           |_| |_|\___/ __/\_/   \__\___/            | 
|                  ____ | | __ _ _   _                |
|                 |  _ \| |/ _` | | | |               | 
|                 | |_) | | (_| | |_| |               | 
|                 | .__/|_|\__,_|\__, |               | 
|                 |_|            |___/                | 
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
|                                                     | 
|                                                     | 
|                                                     | 
|                                                     | 
|-----------------------------------------------------|
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
imprimirCasa(Peca, 2):-
        write('  '), write(Peca), write(' ').      
imprimirCasa(_, _):-
        write('     ').
        
% Imprime as pecas que estao numa determinada linha do tabuleiro
imprimirPecasLinha([]).
imprimirPecasLinha([H | T]):- 
        atom_length(H, L), write('|'),
        imprimirCasa(H, L),
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
/* imprimirListaPecasCapturadas([]).
imprimirListaPecasCapturadas([H | T]):-
        write(H), write(' '),
        imprimirListaPecasCapturadas(T). */ 

% Imprime uma lista de pecas capturadas pelo jogador "Jogador"
/* imprimirListaPecasCapturadas(Jogador, ListaPecas):-
        write('- Jogador '), write(Jogador), nl,
        imprimirListaPecasCapturadas(ListaPecas). */

% Imprime as pecas capturadas pelos dois jogadores
/* imprimirPecasCapturadas:-
        pecasCapturadas(branco, Lista1),
        pecasCapturadas(preto, Lista2), nl,
        write(' __________________'), nl, write('|_Pecas_Capturadas_|'), nl,
        imprimirListaPecasCapturadas(branco, Lista1), nl, nl,
        imprimirListaPecasCapturadas(preto, Lista2). */
        
% Imprime o tabuleiro com o estado atual do jogo
imprimirTabuleiro([H | T]):-
        imprimirSeparadorInicial, nl,
        numeroLinhas(ListaLinhas),
        imprimirLinhas([H | T], ListaLinhas), nl,
        impimirIdentificadoresColunas, nl.
        % imprimirPecasCapturadas, nl, nl. 

% Inicia o jogo Corrida de Reis
começarCorridaReis:-
        inicializarTabuleiro(T), imprimirTabuleiro(T). 

% Imprime o menu inicial
imprimirMenuIncial :-
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
        write(' |            _   _                 _                  | '), nl,
        write(' |           | | | | _____      __ | |_ ___            | '), nl,
        write(' |           | |_| |/ _ \\ \\ /\\ / / | __/ _ \\           | '), nl,
        write(' |           |  _  | (_) \\ V  V /  | || (_) |          | '), nl,
        write(' |           |_| |_|\\___/ __/\\_/   \\__\\___/            | '), nl,
        write(' |                  ____ | | __ _ _   _                |'), nl,
        write(' |                 |  _ \\| |/ _` | | | |               | '), nl, 
        write(' |                 | |_) | | (_| | |_| |               | '), nl, 
        write(' |                 | .__/|_|\\__,_|\\__, |               | '), nl,
        write(' |                 |_|            |___/                | '), nl, 
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
        write(' |                                                     | '), nl,
        write(' |                                                     | '), nl, 
        write(' |                                                     | '), nl, 
        write(' |                                                     | '), nl, 
        write(' |-----------------------------------------------------| '), nl.

% Selecciona o modo de jogo
selecionarModoJogo :-
        read(Action),
        Action > 0,
        Action < 6,
        modoJogo(Action).

% humano vs humano
modoJogo(1) :-
        começarCorridaReis.

% computador vs humanos
modoJogo(2) :-
        começarCorridaReis.

% computador vs computador
modoJogo(3) :-
        começarCorridaReis.

% menu de ajuda
modoJogo(4) :-
        imprimirMenuAjuda.

% sair
modoJogo(5) :-
        write('Exit!').


% *****************
% * inicia o jogo *
% *****************
start :-
        imprimirMenuIncial,
        selecionarModoJogo.
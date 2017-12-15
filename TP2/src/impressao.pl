/* ***********
 * impressao *
 *********** */

imprimirMenuInicial:-
        nl,nl,
        write(' _____________________________________________________'), nl,  
        write('|                                                    |'), nl,    
        write('|   ____    ___    _____ ____   ____   ____  ____    |'), nl,
        write('|  |    \\  /   \\  / ___/|     \\|    | /    ||    \\   |'), nl,
        write('|  |  o  )|     |(   \\_ |  _  | |  | |  o  ||  _  |  |'), nl,
        write('|  |     ||  O  | \\__  ||  |  | |  | |     ||  |  |  |'), nl,
        write('|  |  O  ||     |  / \\ ||  |  | |  | |  _  ||  |  |  |'), nl,
        write('|  |     ||     | \\    ||  |  | |  | |  |  ||  |  |  |'), nl,
        write('|  |_____| \\___/   \\___||__|__||____||__|__||__|__|  |'), nl,
        write('|           _____ ____    ____  __  _    ___         |'), nl,
        write('|         / ___/ |    \\  /    ||  |/ ]  /  _]        |'), nl,
        write('|        (  \\_   |  _  ||  o  ||    /  /  [_         |'), nl,
        write('|         \\__  | |  |  ||     ||   \\  |    _]        |'), nl,
        write('|          / \\ | |  |  ||  _  ||    \\ |   [_         |'), nl,
        write('|         \\    | |  |  ||  |  ||  .  ||     |        |'), nl,
        write('|          \\___| |__|__||__|__||__|\\_||_____|        | '), nl,
        write('|                                                    |'), nl,
        write('|                                                    |'), nl,
        write('|                   PLOG 2017/2018                   |'), nl,
        write('|----------------------------------------------------|'), nl,
        write('|                                                    |'), nl, 
        write('|          1. Iniciar jogo - Tabuleiro 6x6           |'), nl,
        write('|          2. Iniciar jogo - Tabuleiro 9x9           |'), nl,
        write('|          3. Iniciar jogo - Tabuleiro 12x12         |'), nl,
        write('|          4. Gerar tabuleiro com pistas             |'), nl,
        write('|          5. Exit                                   |'), nl,
        write('|                                                    |'), nl,
        write('|                 Escolha uma op��o                  |'), nl,
        write('|----------------------------------------------------|'), nl.

selecionarTabuleiro:- 
        read(OPCAO),
        OPCAO > 0,
        OPCAO < 6, !,
        modoJogo(OPCAO).

selecionarTabuleiro:-
        write('Introduza uma op��o v�lida!'),nl,
        selecionarTabuleiro.

% Imprime o limite superior do tabuleiro
imprimirSeparadorInicial(0,_).

imprimirSeparadorInicial(TAMANHO,SEPARADOR):-
        write(SEPARADOR),
        TAMANHO1 is TAMANHO - 1,
        imprimirSeparadorInicial(TAMANHO1, SEPARADOR).

imprimirSeparadorInicial(TAMANHO):-
        imprimirSeparadorInicial(TAMANHO,'______').

% Imprime o separador de linhas do tabuleiro
imprimirSeparadorLinhas(0,_).

imprimirSeparadorLinhas(TAMANHO,SEPARADOR):-
        write(SEPARADOR),
        TAMANHO1 is TAMANHO - 1,
        imprimirSeparadorLinhas(TAMANHO1, SEPARADOR).

imprimirSeparadorLinhas(TAMANHO):-
        imprimirSeparadorLinhas(TAMANHO,'|_____').

% Imprime o separador de colunas do tabuleiro
imprimirSeparadorColunas(0,_).

imprimirSeparadorColunas(TAMANHO,SEPARADOR):-
        write(SEPARADOR),
        TAMANHO1 is TAMANHO - 1,
        imprimirSeparadorColunas(TAMANHO1, SEPARADOR).

imprimirSeparadorColunas(TAMANHO):-
        imprimirSeparadorColunas(TAMANHO,'|     ').

imprimirBarraSeparadorColuna:-
        write('|'), nl.

% Imprime uma casa do tabuleiro com a peca "Peca"
imprimirCasa(0):-
        write('     ').
imprimirCasa(-1):-
        write('  '), write('X'), write('  ').
imprimirCasa(H):-
        write('  '), write(H), write('  ').
       
% Imprime as pecas que estao numa determinada linha do tabuleiro
imprimirPecasLinha([]).
imprimirPecasLinha([H | T]):- 
        write('|'),
        imprimirCasa(H),
        imprimirPecasLinha(T).

% Imprime a linha numero "NLinha" do tabuleiro
imprimirLinha([],_).
imprimirLinha(LINHA,TAMANHO):-
        imprimirSeparadorColunas(TAMANHO), 
        imprimirBarraSeparadorColuna,
        imprimirPecasLinha(LINHA), 
        imprimirBarraSeparadorColuna,
        imprimirSeparadorLinhas(TAMANHO),
        imprimirBarraSeparadorColuna.

% Imprime todas as linhas do tabuleiro
imprimirLinhas([],_). 
imprimirLinhas([LINHA | T],TAMANHO):- 
        imprimirLinha(LINHA,TAMANHO), 
        imprimirLinhas(T,TAMANHO).

% Imprime o tabuleiro com o estado atual do jogo
imprimirTabuleiro(TAB):-
        getTamanhoTab(TAB,TAMANHO),
        imprimirSeparadorInicial(TAMANHO), nl,
        imprimirLinhas(TAB,TAMANHO).
:-use_module(library(random)).
:-ensure_loaded('impressao.pl').
:-ensure_loaded('geral.pl').
:-ensure_loaded('logica.pl').
:-ensure_loaded('random.pl').

/*****
 main
******/

run:-
        imprimirMenuInicial,
        selecionarTabuleiro.

modoJogo(1):-
        iniciarJogo(6).

modoJogo(2):-
        iniciarJogo(9).

modoJogo(3):-
        iniciarJogo(12).

modoJogo(4):-
         iniciarJogoRandom.

modoJogo(5):-
         write('Exit!').

iniciarJogo(TAMANHO):-
        tabuleiro(TAMANHO,TAB),
        getCasasCobraLinhaColuna(TAMANHO,COBRA_LINHA,COBRA_COLUNA),
        imprimirTabuleiro(TAB),
        getSolucao(TAB,COBRA_LINHA,COBRA_COLUNA,TAB1), !,
        imprimirTabuleiro(TAB1).

% Obtem a solução de um tabuleiro

getSolucao(TAB,COBRA_LINHA,COBRA_COLUNA,TAB1):-
        getTamanhoTab(TAB,TAMANHO), !,
        validarDuasPosicoesCobra(TAB,POSICOES,TAMANHO),
        inicializarTab(TAB,TAB1), % definir dominios para as casas não inicializadas do tabuleiro
        validarInicioFimCobra(TAB1,POSICOES), % primeira restrição 
        validarCasasCobraLinhaColuna(TAB1,COBRA_LINHA,COBRA_COLUNA), % segunda restrição
        validarCasasCobraAround(TAB,TAB1,1), % terceira restrição, 1 e o NLINHA
        validarDoisVizinhosCobra(TAB1,TAB1,1,POSICOES), % quarta restrição, 1 e o NLINHA
        validarIntersecaoDiagonal(TAB1,TAB1,TAMANHO), % quinta restrição        
        maplist(labeling([]),TAB1),
        verificarCobraConexa(TAB1,TAMANHO,POSICOES).

% Jogo Random

introduzirTamanhoTabuleiro(TAMANHO):-
        write('Introduza um tamanho para o tabuleiro valido!'),nl,
        read(TAMANHO),nl,
        TAMANHO > 2, !.

introduzirTamanhoTabuleiro(TAMANHO):-
        introduzirTamanhoTabuleiro(TAMANHO).

introduzirPosicaoInicialFinal(TAB,TAMANHO,POSICOES,TAB1):-
        write('Introduza uma posicao inicial e final para a cobra no formato:'),nl,
        write('LinhaInicial/ColunaInicial - LinhaFinal/ColunaFinal'),nl,
        read(LI/CI - LF/CF),nl,
        inicializarTabuleiroRandom(TAB,LI/CI,LF/CF,TAB1),
        validarDuasPosicoesCobra(TAB1,POSICOES,TAMANHO).
        
introduzirPosicaoInicialFinal(TAB,TAMANHO,[LI/CI,LF/CF],TAB1):-
        introduzirPosicaoInicialFinal(TAB,TAMANHO,[LI/CI,LF/CF],TAB1).

gerarPistas(_,0,_,_,PISTAS,PISTAS).

gerarPistas(TAB,NPISTAS,MAX,POSICOES,AUXPISTAS,PISTAS):-
        random(1,MAX,LINHA),
        random(1,MAX,COLUNA),
        \+member(LINHA/COLUNA,POSICOES),
        getCasaTabuleiro(TAB,LINHA,COLUNA,CASA),
        CASA = 0,
        getElementosVizinhos(TAB,[[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]],LINHA,COLUNA,LISTAVIZINHOS),
        sumlist(LISTAVIZINHOS,SUM),
        SUM < 0,
        NPISTAS1 is NPISTAS - 1,
        gerarPistas(TAB,NPISTAS1,MAX,POSICOES,[LINHA/COLUNA|AUXPISTAS],PISTAS).

gerarPistas(TAB,NPISTAS,MAX,POSICOES,AUXPISTAS,PISTAS):-
        gerarPistas(TAB,NPISTAS,MAX,POSICOES,AUXPISTAS,PISTAS).

apagarCobraEscreverPistasLinha(_,[],[],_,_,_,_).

apagarCobraEscreverPistasLinha(TAB,[_|T],[SUM1|T1],PISTAS,POSICOES,NLINHA,NCOLUNA):-
        member(NLINHA/NCOLUNA,PISTAS),
        getElementosVizinhos(TAB,[[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]],NLINHA,NCOLUNA,LISTAVIZINHOS),
        sumlist(LISTAVIZINHOS,SUM),
        SUM1 is abs(SUM),
        NCOLUNA1 is NCOLUNA + 1,
        apagarCobraEscreverPistasLinha(TAB,T,T1,PISTAS,POSICOES,NLINHA,NCOLUNA1).


apagarCobraEscreverPistasLinha(TAB,[_|T],[-1|T1],PISTAS,POSICOES,NLINHA,NCOLUNA):-
        member(NLINHA/NCOLUNA,POSICOES),
        NCOLUNA1 is NCOLUNA + 1,
        apagarCobraEscreverPistasLinha(TAB,T,T1,PISTAS,POSICOES,NLINHA,NCOLUNA1).

apagarCobraEscreverPistasLinha(TAB,[_|T],[0|T1],PISTAS,POSICOES,NLINHA,NCOLUNA):-
        NCOLUNA1 is NCOLUNA + 1,
        apagarCobraEscreverPistasLinha(TAB,T,T1,PISTAS,POSICOES,NLINHA,NCOLUNA1).

apagarCobraEscreverPistas(_,[],[],_,_,_).

apagarCobraEscreverPistas(TAB,[H|T],[H1|T1],PISTAS,POSICOES,NLINHA):-
        apagarCobraEscreverPistasLinha(TAB,H,H1,PISTAS,POSICOES,NLINHA,1),
        NLINHA1 is NLINHA + 1,
        apagarCobraEscreverPistas(TAB,T,T1,PISTAS,POSICOES,NLINHA1).
        
apagarCobraEscreverPistas(TAB,TAMANHO,POSICOES,TAB1):-
        NPISTAS is TAMANHO div 2,
        MAX is TAMANHO + 1,
        gerarPistas(TAB,NPISTAS,MAX,POSICOES,[],PISTAS),
        apagarCobraEscreverPistas(TAB,TAB,TAB1,PISTAS,POSICOES,1).

iniciarJogoRandom(TAMANHO,POSICOES,TAB):-
        imprimirTabuleiro(TAB),
        inicializarTab(TAB,TAB1),
        validarInicioFimCobra(TAB1,POSICOES),
        validarCasasCobraAround(TAB,TAB1,1),
        validarDoisVizinhosCobra(TAB1,TAB1,1,POSICOES),
        validarIntersecaoDiagonal(TAB1,TAB1,TAMANHO),        
        maplist(labeling([]),TAB1),
        verificarCobraConexa(TAB1,TAMANHO,POSICOES),
        imprimirTabuleiro(TAB1),
        apagarCobraEscreverPistas(TAB1,TAMANHO,POSICOES,TAB2),
        imprimirTabuleiro(TAB2).
        
iniciarJogoRandom:-
        introduzirTamanhoTabuleiro(TAMANHO),
        gerarTabuleiro(TAMANHO,TAB),
        introduzirPosicaoInicialFinal(TAB,TAMANHO,POSICOES,TAB1),
        iniciarJogoRandom(TAMANHO,POSICOES,TAB1).
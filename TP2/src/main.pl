:-ensure_loaded('impressao.pl').
:-ensure_loaded('geral.pl').
:-ensure_loaded('logica.pl').

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
        iniciarJogo(10).

modoJogo(4):-
         write('Exit!').

iniciarJogo(TAMANHO):-
        tabuleiro(TAMANHO,TAB),
        getCasasCobraLinhaColuna(TAMANHO,COBRA_LINHA,COBRA_COLUNA),
        imprimirTabuleiro(TAB),
        getSolucao(TAB,COBRA_LINHA,COBRA_COLUNA,TAB1), !,
        imprimirTabuleiro(TAB1).

% Obtem a solução de um tabuleiro

getSolucao(TAB,COBRA_LINHA,COBRA_COLUNA,TAB1):-
        validarDuasPosicoesCobra(TAB,POSICOES),
        inicializarTab(TAB,TAB1), % definir dominios para as casas não inicializadas do tabuleiro
        validarInicioFimCobra(TAB1,POSICOES), % primeira restrição 
        validarCasasCobraLinhaColuna(TAB1,COBRA_LINHA,COBRA_COLUNA), % segunda restrição
        validarCasasCobraAround(TAB,TAB1,1), % terceira restrição, 1 e o NLINHA
        validarDoisVizinhosCobra(TAB1,TAB1,1,POSICOES), % quarta restrição, 1 e o NLINHA
        validarIntersecaoDiagonal(TAB1,TAB1), % quinta restrição        
        maplist(labeling([]),TAB1).

%%%%%%%%%%%%%%%
% substituir nth1 por element?
% falta a sexta restrição que é verificar se todos os -1 no tabuleiro estao conexos
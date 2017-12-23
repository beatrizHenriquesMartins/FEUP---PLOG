:-use_module(library(clpfd)).
:-use_module(library(lists)).
:-use_module(library(between)).

/* ****************
 * logica do jogo *
 **************** */

% Quinta Restrição - Nao pode haver diagonais

validarDiagonalNaoDiagonalRestricao(TAB,NLINHA,NCOLUNA,NLINHA1,NCOLUNA1):-
        getCasaTabuleiro(TAB,NLINHA,NCOLUNA,CASA),
        getCasaTabuleiro(TAB,NLINHA1,NCOLUNA1,CASA1),
        getCasaTabuleiro(TAB,NLINHA1,NCOLUNA,CASAVIZINHA1),
        getCasaTabuleiro(TAB,NLINHA,NCOLUNA1,CASAVIZINHA2),
        (CASA #= -1 #/\ CASA1 #= -1) #=> 
        (CASAVIZINHA1 #= -1 #/\ CASAVIZINHA2 #= 0) 
        #\/
        (CASAVIZINHA1 #= 0 #/\ CASAVIZINHA2 #= -1).

validarDiagonalNaoDiagonal(_,[],_,_,_).

validarDiagonalNaoDiagonal(TAB,[[NL,NC]|T],NLINHA,NCOLUNA,TAMANHO):-
        NLINHA1 is NLINHA - NC, 
        NCOLUNA1 is NCOLUNA + NL, 
        between(1,TAMANHO,NLINHA1),
        between(1,TAMANHO,NCOLUNA1),
        validarDiagonalNaoDiagonalRestricao(TAB,NLINHA,NCOLUNA,NLINHA1,NCOLUNA1), !,
        validarDiagonalNaoDiagonal(TAB,T,NLINHA,NCOLUNA,TAMANHO).

validarDiagonalNaoDiagonal(TAB,[[_,_]|T],NLINHA,NCOLUNA,TAMANHO):-
        validarDiagonalNaoDiagonal(TAB,T,NLINHA,NCOLUNA,TAMANHO).

validarIntersecaoDiagonal([],_,_,_,_).
        
validarIntersecaoDiagonal([_|T],TAB1,NLINHA,NCOLUNA,TAMANHO):-
        validarDiagonalNaoDiagonal(TAB1,[[-1,-1],[-1,1],[1,-1],[1,1]],NLINHA,NCOLUNA,TAMANHO),
        NCOLUNA1 is NCOLUNA + 1,
        validarIntersecaoDiagonal(T,TAB1,NLINHA,NCOLUNA1,TAMANHO).

validarIntersecaoDiagonal([],_,_,_).

validarIntersecaoDiagonal([H|T],TAB1,NLINHA,TAMANHO):-
        validarIntersecaoDiagonal(H,TAB1,NLINHA,1,TAMANHO),
        NLINHA1 is NLINHA + 1,
        validarIntersecaoDiagonal(T,TAB1,NLINHA1,TAMANHO).

validarIntersecaoDiagonal(TAB,TAB1,TAMANHO):-
        validarIntersecaoDiagonal(TAB,TAB1,1,TAMANHO).

% Quarta Restrição - A cobra não pode tocar em si mesma

validarDoisVizinhosCobra([],_,_,_,_).

validarDoisVizinhosCobra([_|T],TAB,NLINHA,NCOLUNA,[LI/CI,LF/CF]):-
        ((NLINHA = LF, NCOLUNA = CF) ; (NLINHA = LI, NCOLUNA = CI)),
        NCOLUNA1 is NCOLUNA + 1,
        validarDoisVizinhosCobra(T,TAB,NLINHA,NCOLUNA1,[LI/CI,LF/CF]),!.

validarDoisVizinhosCobra([_|T],TAB,NLINHA,NCOLUNA,[LI/CI,LF/CF]):-
        getElementosVizinhos(TAB,[[-1,0],[0,1],[1,0],[0,-1]],NLINHA,NCOLUNA,LISTAVIZINHOS),
        getCasaTabuleiro(TAB,NLINHA,NCOLUNA,CASA), 
        count(-1,LISTAVIZINHOS,#=,COUNT), 
        CASA #= -1 #=> COUNT #= 2,
        NCOLUNA1 is NCOLUNA + 1,
        validarDoisVizinhosCobra(T,TAB,NLINHA,NCOLUNA1,[LI/CI,LF/CF]).

validarDoisVizinhosCobra([],_,_,_).
        
validarDoisVizinhosCobra([H|T],TAB1,NLINHA,POSINICIALFINAL):-
        validarDoisVizinhosCobra(H,TAB1,NLINHA,1,POSINICIALFINAL),
        NLINHA1 is NLINHA + 1,
        validarDoisVizinhosCobra(T,TAB1,NLINHA1,POSINICIALFINAL).

% Terceira Restrição - O número de casa ocupadas pela cobra em volta da casa 'H' tem que ser igual a H (H e um numero de 1 a 7)

validarCasasCobraAroundLinha([],_,_,_).

validarCasasCobraAroundLinha([H|T],TAB1,NLINHA,NCOLUNA):-
        H > 0,
        getElementosVizinhos(TAB1,[[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]],NLINHA,NCOLUNA,LISTAVIZINHOS),
        getCasaTabuleiro(TAB1,NLINHA,NCOLUNA,CASA),
        count(-1,LISTAVIZINHOS,#=,COUNT),
        CASA #= 0 #=> COUNT #= H,
        NCOLUNA1 is NCOLUNA + 1,
        validarCasasCobraAroundLinha(T,TAB1,NLINHA,NCOLUNA1).

validarCasasCobraAroundLinha([_|T],TAB1,NLINHA,NCOLUNA):-
        NCOLUNA1 is NCOLUNA + 1,
        validarCasasCobraAroundLinha(T,TAB1,NLINHA,NCOLUNA1).

validarCasasCobraAround([],_,_).
        
validarCasasCobraAround([H|T],TAB1,NLINHA):-
        validarCasasCobraAroundLinha(H,TAB1,NLINHA,1), % H e a linha, TAB1 e o tabueleiro solucao, TAMANHO e o tamanho do tabuleiro, NLINHA e o numero da linha
        NLINHA1 is NLINHA + 1,
        validarCasasCobraAround(T,TAB1,NLINHA1).

% Segunda Restrição - O total de casas ocupadas pela cobra numa linha ou coluna tem que ser igual a N

validarCasasCobraColuna(_,[]).

validarCasasCobraColuna(TAB,[COLUNA-COBRACOLUNA|T]):-
        nth1(COLUNA,TAB,COLUNA_TAB),
        sum(COLUNA_TAB,#=,COBRACOLUNA1),
        COBRACOLUNA1 #= (COBRACOLUNA * -1),
        validarCasasCobraColuna(TAB,T).

validarCasasCobraLinha(_,[]).

validarCasasCobraLinha(TAB,[LINHA-COBRALINHA|T]):-
        nth1(LINHA,TAB,LINHA_TAB),
        sum(LINHA_TAB,#=,COBRALINHA1),
        COBRALINHA1 #= (COBRALINHA * -1),
        validarCasasCobraColuna(TAB,T).

validarCasasCobraLinhaColuna(TAB,COBRA_LINHA,COBRA_COLUNA):-
        validarCasasCobraLinha(TAB,COBRA_LINHA),
        transpose(TAB,TTAB),
        validarCasasCobraColuna(TTAB,COBRA_COLUNA).

% Primeira Restrição - O inicio e o fim da cobra so pode ter um vizinho

% Percorre-se coluna a coluna porque o inicio e fim da cobra pode estar na mesma linha

validarInicioFimCobra(TAB,NLINHA,NCOLUNA):-
        getElementosVizinhos(TAB,[[-1,0],[0,1],[1,0],[0,-1]],NLINHA,NCOLUNA,LISTAVIZINHOS),
        getCasaTabuleiro(TAB,NLINHA,NCOLUNA,CASA),
        count(-1,LISTAVIZINHOS,#=,COUNT),
        CASA #= -1 #=> COUNT #= 1.
        
validarInicioFimCobra(_,[]).

validarInicioFimCobra(TAB,[L/C|T]):-
        validarInicioFimCobra(TAB,L,C),
        validarInicioFimCobra(TAB,T).

% Define o domínio das casas do tabuleiro solucao

inicializarLinha([],[]).

inicializarLinha([-1|T],[H1|T1]):-
        H1 in -1.. -1,
        inicializarLinha(T,T1).

inicializarLinha([H|T],[H1|T1]):-
        H > 0,
        H1 in 0..0,
        inicializarLinha(T,T1).

inicializarLinha([_|T],[H1|T1]):-
        H1 in -1..0,
        inicializarLinha(T,T1).

inicializarTab([],[]).

inicializarTab([HTAB|TTAB],[HTAB1|TTAB1]):-
        inicializarLinha(HTAB,HTAB1),
        inicializarTab(TTAB,TTAB1).

% Valida se no tabuleiro inicial existem apenas dois zeros (inicio e fim da cobra)

validarDuasPosicoesCobra([],_,_,POSICOES,POSICOES).

validarDuasPosicoesCobra([H|T],NLINHA,NCOLUNA,POSICOES,POSICOES1):-
        H = -1,
        NCOLUNA1 is NCOLUNA + 1,
        validarDuasPosicoesCobra(T,NLINHA,NCOLUNA1,[NLINHA/NCOLUNA|POSICOES],POSICOES1).

validarDuasPosicoesCobra([_|T],NLINHA,NCOLUNA,POSICOES,POSICOES1):-
        NCOLUNA1 is NCOLUNA + 1,
        validarDuasPosicoesCobra(T,NLINHA,NCOLUNA1,POSICOES,POSICOES1).

validarDuasPosicoesCobra([],_,POSICOES,POSICOES).

validarDuasPosicoesCobra([H|T],NLINHA,POSICOES,POSICOES2):-
        validarDuasPosicoesCobra(H,NLINHA,1,POSICOES,POSICOES1),
        NLINHA1 is NLINHA + 1,
        validarDuasPosicoesCobra(T,NLINHA1,POSICOES1,POSICOES2).

validarDuasPosicoesCobra(TAB,[LI/CI,LF/CF],TAMANHO):-
        validarDuasPosicoesCobra(TAB,1,[],[LI/CI,LF/CF]),
        getListaComPosicoes([[-1,0],[0,1],[1,0],[0,-1]],LI,CI,TAMANHO,LISTAVIZINHOS),
        \+member(LF-CF,LISTAVIZINHOS).

/* *******
 * utils *
 ******* */

getListaComPosicoes([],_,_,_,[]).

getListaComPosicoes([[L,C]|T],NLINHA,NCOLUNA,TAMANHO,[LINHA1-COLUNA1|POSICOES]):-
        LINHA1 is NLINHA + L,
        between(1,TAMANHO,LINHA1),
        COLUNA1 is NCOLUNA + C,
        between(1,TAMANHO,COLUNA1), !,
        getListaComPosicoes(T,NLINHA,NCOLUNA,TAMANHO,POSICOES).

getListaComPosicoes([_|T],NLINHA,NCOLUNA,TAMANHO,POSICOES):-
        getListaComPosicoes(T,NLINHA,NCOLUNA,TAMANHO,POSICOES).

getListaComElementos(_,[],[]).
      
getListaComElementos(TAB,[NLINHA-NCOLUNA|T],[ELMEN|ELEMENTOS]):-
        getElemento(TAB,NLINHA,NCOLUNA,ELMEN),
        getListaComElementos(TAB,T,ELEMENTOS).
        
getElementosVizinhos(TAB,POSICOES,NLINHA,NCOLUNA,ELEMENTOS):-
        getTamanhoTab(TAB,TAMANHO),
        getListaComPosicoes(POSICOES,NLINHA,NCOLUNA,TAMANHO,LISTAVIZINHOS),
        getListaComElementos(TAB,LISTAVIZINHOS,ELEMENTOS).

getElemento(TAB,NLINHA,NCOLUNA,ELEMENTO):-
        getCasaTabuleiro(TAB,NLINHA,NCOLUNA,ELEMENTO).

getTamanhoTab([H|_],TAMANHO):-
        length(H,TAMANHO).

getCasaTabuleiro(TAB,NLINHA,NCOLUNA,CASA):-
        nth1(NLINHA,TAB,LINHA_TAB),
        nth1(NCOLUNA,LINHA_TAB,CASA).

getCasasCobraLinhaColuna(TAMANHO,COBRA_LINHA,COBRA_COLUNA):-
        findall(
                LINHA-COBRALINHA,
                tabuleiroLinha(TAMANHO,LINHA,COBRALINHA),
                COBRA_LINHA),
        findall(
                COLUNA-COBRALINHA,
                tabuleiroColuna(TAMANHO,COLUNA,COBRALINHA),
                COBRA_COLUNA).

% Verifica conexão de todos os -1 da solução

getVizinhoConexo(TAB,[NLINHA-NCOLUNA|_],NLINHA,NCOLUNA,POSICOES):-
        getCasaTabuleiro(TAB,NLINHA,NCOLUNA,CASA),
        CASA = -1, 
        \+member(NLINHA/NCOLUNA,POSICOES), !.

getVizinhoConexo(TAB,[_|T],NLINHA,NCOLUNA,POSICOES):-
        getVizinhoConexo(TAB,T,NLINHA,NCOLUNA,POSICOES).
        
getListaPosicoesCobra(_,LF/CF,LF/CF,_,POSICOESCOBRA,POSICOESCOBRA).

getListaPosicoesCobra(TAB,LI/CI,LF/CF,TAMANHO,POSICOES,POSICOESCOBRA):-
        getListaComPosicoes([[-1,0],[0,1],[1,0],[0,-1]],LI,CI,TAMANHO,LISTAVIZINHOS),
        getVizinhoConexo(TAB,LISTAVIZINHOS,NLINHA,NCOLUNA,POSICOES),
        getListaPosicoesCobra(TAB,NLINHA/NCOLUNA,LF/CF,TAMANHO,[NLINHA/NCOLUNA|POSICOES],POSICOESCOBRA).

getListaPosicoesCobra(TAB,TAMANHO,[PI,PF],POSICOESCOBRA):-
        getListaPosicoesCobra(TAB,PI,PF,TAMANHO,[PI],POSICOESCOBRA).

validarTodosMenosUmEmCobraLinha([],_,_,_).
        
validarTodosMenosUmEmCobraLinha([H|T],POSICOESCOBRA,NLINHA,NCOLUNA):-
        H = -1,
        member(NLINHA/NCOLUNA,POSICOESCOBRA),
        NCOLUNA1 is NCOLUNA + 1,
        validarTodosMenosUmEmCobraLinha(T,POSICOESCOBRA,NLINHA,NCOLUNA1).

validarTodosMenosUmEmCobraLinha([H|T],POSICOESCOBRA,NLINHA,NCOLUNA):-
        H = 0,
        NCOLUNA1 is NCOLUNA + 1,
        validarTodosMenosUmEmCobraLinha(T,POSICOESCOBRA,NLINHA,NCOLUNA1).

validarTodosMenosUmEmCobra([],_,_).
        
validarTodosMenosUmEmCobra([H|T],POSICOESCOBRA,NLINHA):-
        validarTodosMenosUmEmCobraLinha(H,POSICOESCOBRA,NLINHA,1),
        NLINHA1 is NLINHA + 1,
        validarTodosMenosUmEmCobra(T,POSICOESCOBRA,NLINHA1).

verificarCobraConexa(TAB,TAMANHO,POSICOES):-
        reverse(POSICOES,POSICOES1),
        getListaPosicoesCobra(TAB,TAMANHO,POSICOES1,POSICOESCOBRA),
        validarTodosMenosUmEmCobra(TAB,POSICOESCOBRA,1).   
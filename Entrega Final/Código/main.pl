:- use_module(library(random)).
:- use_module(library(system)).
:- ensure_loaded('impressao.pl').

clearScreen:-
        write('\33\[2J'),nl.

% JOGADOR VS JOGADOR 
startPvP(TAB,JOGADOR):-
        imprimirTabuleiro(TAB),
        getPosicaoInicial(TAB,JOGADOR,CASA),
        verificarAcabar(TAB,0,0,_,_),
        getPosicaoFinal(TAB,JOGADOR,CASA,GANHOU,NEWTAB),
        verificarAcabar(NEWTAB,GANHOU,1,JOGADOR,pvp).

% JOGADOR VS COMPUTADOR
startPCvP(TAB,JOGADOR,_,humano):-
        imprimirTabuleiro(TAB),
        getPosicaoInicial(TAB,JOGADOR,CASA),
        verificarAcabar(TAB,0,0,_,_),
        getPosicaoFinal(TAB,JOGADOR,CASA,GANHOU,NEWTAB),
        verificarAcabar(NEWTAB,GANHOU,1,JOGADOR,pcvp1).

startPCvP(TAB,JOGADOR,NIVEL,computador):-
        imprimirTabuleiro(TAB),
        getPosicaoInicial(TAB,NIVEL,JOGADOR,CASAI),
        verificarAcabar(TAB,0,0,_,_),
        getPosicaoFinal(TAB,NIVEL,CASAI,GANHOU,NEWTAB,computador),
        verificarAcabar(NEWTAB,GANHOU,1,JOGADOR,pcvp1).

% COMPUTADOR VS COMPUTADOR
startPCvPC(TAB,JOGADOR,NIVEL,NIVEL1):-
        sleep(3),
        imprimirTabuleiro(TAB),
        getPosicaoInicial(TAB,NIVEL,JOGADOR,CASAI),
        verificarAcabar(TAB,0,0,_,_),
        getPosicaoFinal(TAB,NIVEL,CASAI,GANHOU,NEWTAB,computador),
        verificarAcabar(NEWTAB,GANHOU,1,JOGADOR,NIVEL,NIVEL1,pcvpc).
   
% P vs P
getPosicaoInicial(TAB,JOGADOR,CASA):-
        write(' Jogador '), write(JOGADOR),write(' '),write('-'),write(' '),
        write(' Insira a posição da peça que pretende '), nl,
        write(' mover no formato LINHA/COLUNA!'),nl,
        read(PL/PC),
        validarPosicaoInicialIntroduzida(TAB,PL,PC,JOGADOR,CASA).

getPosicaoInicial(TAB,JOGADOR,CASA):-
        clearScreen, imprimirTabuleiro(TAB),
        write('Posicao inválida. Insira novamente.'),nl,
        getPosicaoInicial(TAB,JOGADOR,CASA).

% PC vs P && PC vs PC
getPosicaoInicial(TAB,1,JOGADOR,CASAI):-
        jogarNivel1Inicial(TAB,JOGADOR,{PL,PC,_,_}),
        validarPosicaoInicialIntroduzida(TAB,PL,PC,JOGADOR,CASAI).

getPosicaoInicial(TAB,1,JOGADOR,CASAI):-
        getPosicaoInicial(TAB,1,JOGADOR,CASAI).

getPosicaoInicial(TAB,2,JOGADOR,CASAI):-
        jogarNivel2Inicial(TAB,JOGADOR,{PL,PC,_,_}),
        validarPosicaoInicialIntroduzida(TAB,PL,PC,JOGADOR,CASAI).

getPosicaoInicial(TAB,2,JOGADOR,CASAI):-
        getPosicaoInicial(TAB,2,JOGADOR,CASAI).

% P vs P
getPosicaoFinal(TAB,JOGADOR,CASA,GANHOU,NEWTAB):-
        write('Jogador '), write(JOGADOR),write(' '),write('-'),write(' '),
        write('Insira a posição para onde pretende mover a peça no formato LINHA/COLUNA!'),nl,
        read(FL/FC),
        validarPosicaoFinalIntroduzida(TAB,FL,FC,CASA,GANHOU,NEWTAB).

getPosicaoFinal(TAB,JOGADOR,CASA,GANHOU,NEWTAB):-
        clearScreen, imprimirTabuleiro(TAB),
        write('Posicao inválida. Insira novamente.'),nl,
        getPosicaoFinal(TAB,JOGADOR,CASA,GANHOU,NEWTAB).

% PC vs P && PC vs PC
getPosicaoFinal(TAB,1,CASA,GANHOU,NEWTAB,computador):-
         jogarNivel1Final(TAB,{PL,PC}),
         validarPosicaoFinalIntroduzida(TAB,PL,PC,CASA,GANHOU,NEWTAB),!,
         clearScreen.
         
getPosicaoFinal(TAB,1,CASA,GANHOU,NEWTAB,computador):-
        getPosicaoFinal(TAB,1,CASA,GANHOU,NEWTAB,computador).

getPosicaoFinal(TAB,2,CASA,GANHOU,NEWTAB,computador):-
         jogarNivel2Final({PL,PC}),
         validarPosicaoFinalIntroduzida(TAB,PL,PC,CASA,GANHOU,NEWTAB),!,
         clearScreen.
         
getPosicaoFinal(TAB,2,CASA,GANHOU,NEWTAB,computador):-
        getPosicaoFinal(TAB,2,CASA,GANHOU,NEWTAB,computador).
        
% TABULEIRO,GANHOU,DEVE_CONTINUAR,JOGADOR,TIPOJOGO
% PvP
verificarAcabar(TAB,0,1,branco,pvp):-startPvP(TAB,preto).
verificarAcabar(TAB,0,1,preto,pvp):-startPvP(TAB,branco).

%PCvP - Nivel 1
verificarAcabar(TAB,0,1,branco,pcvp1):-startPCvP(TAB,preto,1,computador).
verificarAcabar(TAB,0,1,preto,pcvp1):-startPCvP(TAB,branco,1,humano).

%PCvP - Nivel 2
verificarAcabar(TAB,0,1,branco,pcvp2):-startPCvP(TAB,preto,2,computador).
verificarAcabar(TAB,0,1,preto,pcvp2):-startPCvP(TAB,branco,2,humano).

%PCvP - Nivel 2
verificarAcabar(TAB,0,1,branco,NIVEL,NIVEL1,pcvpc):-startPCvPC(TAB,preto,NIVEL1,NIVEL).
verificarAcabar(TAB,0,1,preto,NIVEL,NIVEL1,pcvpc):-startPCvPC(TAB,branco,NIVEL1,NIVEL).

verificarAcabar(_,preto,_,_,pcvp1):-write('O COMPUTADOR (PRETO) GANHOU!').
verificarAcabar(_,preto,_,_,pcvp2):-write('O COMPUTADOR (PRETO) GANHOU!').
verificarAcabar(_,preto,_,_,_,_,pcvpc):-write('O COMPUTADOR 2 (PRETO) GANHOU!').
verificarAcabar(_,preto,_,_,_):-write('O JOGADOR PRETO GANHOU!').

verificarAcabar(_,branco,_,_,_,_,pcvpc):-write('O COMPUTADOR 1 (BRANCO) GANHOU!').
verificarAcabar(_,branco,_,_,_):-write('O JOGADOR BRANCO GANHOU!').

verificarAcabar(_,empate,_,_,_,_,pcvpc):-write('O JOGO EMPATOU!').
verificarAcabar(_,empate,_,_,_):-write('O JOGO EMPATOU!').

verificarAcabar(_,0,0,_,_).
       
validarPosicaoInicialIntroduzida(TAB,PL,PC,JOGADOR,CASA):-
        validarDentroTabuleiro(PL,PC),
        validarPecaIntroduzidaJogador(TAB,PL,PC,JOGADOR,CASA).

validarPosicaoFinalIntroduzida(TAB,FL,FC,CASA,GANHOU,L):-
        validarDentroTabuleiro(FL,FC),
        validarMovimento(CASA,{FL,FC}),
        validarIntersecaoEntrePecasBase(CASA,{FL,FC},TAB),
        mexerPecaBase(CASA,{FL,FC},TAB,L),
        verificarXeque(L),
        validarFimJogo(L,GANHOU).

jogarNivel1Inicial(TAB,JOGADOR,CASAI):-
        obterPecasTabuleiro(TAB,PECAS),
        getPosicaoInicialRandom(JOGADOR,PECAS,CASAI).

jogarNivel1Final(TAB,CASAF):-
        obterPecasTabuleiro(TAB,PECAS),
        getPosicaoFinalRandom(PECAS,CASAF).

jogarNivel2Inicial(TAB,JOGADOR,CASAI):-
        obterPecasTabuleiro(TAB,PECAS),
        getPosicaoInicialRandom(JOGADOR,PECAS,CASAI).

jogarNivel2Final(CASAF):-
        getPosicaoFinalRandom(CASAF).

getPosicaoInicialRandom(JOGADOR,PECAS,{LINHA,COLUNA,TIPO,JOGADOR}):-
        random(0,9,LINHA),
        random(0,9,COLUNA),
        member({LINHA,COLUNA,TIPO,JOGADOR},PECAS),!.

getPosicaoInicialRandom(JOGADOR,PECAS,{LINHA,COLUNA,TIPO,JOGADOR}):-
        getPosicaoInicialRandom(JOGADOR,PECAS,{LINHA,COLUNA,TIPO,JOGADOR}).

getPosicaoFinalRandom(PECAS,{LINHA,COLUNA}):-
        random(0,9,LINHA),
        random(0,9,COLUNA),
        \+member({LINHA,COLUNA,_,_},PECAS),!.

getPosicaoFinalRandom(PECAS,{LINHA,COLUNA}):-
        getPosicaoFinalRandom(PECAS,{LINHA,COLUNA}).

getPosicaoFinalRandom({LINHA,COLUNA}):-
        random(0,9,LINHA),
        random(0,9,COLUNA).

%%%%%%%%%%%%%%%%%%%%%%

validarFimJogo(Tabuleiro,JOGADOR):-
        validarFim(Tabuleiro,1, JOGADOR).

validarFim([H|T], 1, empate):-
        validarEmpate(H,T), !.

validarFim([H|_], 1, JOGADOR):-
        !,
        validarReiLinha(H, JOGADOR).

validarFim([_|T], Count, J):-
        C1 is Count + 1,
        validarFim(T, C1, J).
        
validarEmpate(H,[H1|_]):-
        !,
        validarReiLinha(H1, preto),
        validarReiLinha(H, branco),
        validarReiPodeMexer(H1,H).

validarReiPodeMexer([{_,RX,k,preto}|_],LINHA):-
        RX1 is RX-1,
        RX1 > 0,
        verificarNaoHaPesaEm(RX1,LINHA).

validarReiPodeMexer([{_,RX,k,preto}|_],LINHA):-
        RX2 is RX,
        verificarNaoHaPesaEm(RX2,LINHA).

validarReiPodeMexer([{_,RX,k,preto}|_],LINHA):-
        RX3 is RX+1,
        RX3 <9,
        verificarNaoHaPesaEm(RX3,LINHA).

validarReiPodeMexer([_|T], LINHA):-
        validarReiPodeMexer(T, LINHA).

verificarNaoHaPesaEm(_,[]).

verificarNaoHaPesaEm(PX,[{_,X,_,_}|T]):-
        PX\=X,
        verificarNaoHaPesaEm(PX,T).

verificarNaoHaPesaEm(PX,[{}|T]):-
        verificarNaoHaPesaEm(PX,T).

validarReiLinha([], 0).

validarReiLinha([{_,_,k,JOGADOR}|_], JOGADOR):-!.

validarReiLinha([_|T],JOGADOR):-
        validarReiLinha(T,JOGADOR).

verificarXeque(TAB):-
        getPosicoesRei(TAB,POSICAOB,POSICAOP),
        verificarXeque(TAB,POSICAOB,preto,TAB),
        verificarXeque(TAB,POSICAOP,branco,TAB).

verificarXeque([],_,_,_).

verificarXeque([H|T],POSICAOREI,JOGADOR,TAB):-
        verificarXequeRei(H,POSICAOREI,JOGADOR,TAB),
        verificarXeque(T,POSICAOREI,JOGADOR,TAB).    

verificarXequeRei([],_,_,_).

verificarXequeRei([H|T],POSICAOR,JOGADOR,TAB):-
        verificarXequePecas(H,POSICAOR,JOGADOR,TAB),
        verificarXequeRei(T,POSICAOR,JOGADOR,TAB).

verificarXequePecas({PL,PC,q,JOGADOR},{PLR,PCR},JOGADOR,TAB):-
        verificarXequeQueen({PL,PC,q,JOGADOR},{PLR,PCR},JOGADOR,TAB).

verificarXequePecas({PL,PC,c,JOGADOR},{PLR,PCR},JOGADOR,TAB):-
        verificarXequeCavalo({PL,PC,c,JOGADOR},{PLR,PCR},JOGADOR,TAB).

verificarXequePecas({PL,PC,b,JOGADOR},{PLR,PCR},JOGADOR,TAB):-
        verificarXequeBispo({PL,PC,b,JOGADOR},{PLR,PCR},JOGADOR,TAB).

verificarXequePecas({PL,PC,t,JOGADOR},{PLR,PCR},JOGADOR,TAB):-
        verificarXequeTorre({PL,PC,t,JOGADOR},{PLR,PCR},JOGADOR,TAB).

verificarXequePecas({_,_,k,_},_,_,_).

verificarXequePecas({_,_,_,JOGADOR},_,JOGADOR2,_):-JOGADOR\=JOGADOR2.

verificarXequePecas({},_,_,_).

verificarXequeQueen({PL,PC,q,JOGADOR},{PLR,PCR},JOGADOR,_):-
        \+validarMovimentoRainha(PL,PC,PLR,PCR).
        
verificarXequeQueen({PL,PC,q,JOGADOR},{PLR,PCR},JOGADOR,TAB):-
        \+validarIntersecaoEntrePecasBase({PL,PC,q,JOGADOR},{PLR,PCR},TAB).

verificarXequeCavalo({PL,PC,c,JOGADOR},{PLR,PCR},JOGADOR,_):-
        \+validarMovimentoCavalo(PL,PC,PLR,PCR).

verificarXequeBispo({PL,PC,b,JOGADOR},{PLR,PCR},JOGADOR,_):-
        \+validarMovimentoBispo(PL,PC,PLR,PCR).
        
verificarXequeBispo({PL,PC,b,JOGADOR},{PLR,PCR},JOGADOR,TAB):-
        \+validarIntersecaoEntrePecasBase({PL,PC,b,JOGADOR},{PLR,PCR},TAB).

verificarXequeTorre({PL,PC,t,JOGADOR},{PLR,PCR},JOGADOR,_):-
        \+validarMovimentoTorre(PL,PC,PLR,PCR).
        
verificarXequeTorre({PL,PC,t,JOGADOR},{PLR,PCR},JOGADOR,TAB):-
        \+validarIntersecaoEntrePecasBase({PL,PC,t,JOGADOR},{PLR,PCR},TAB).

getPosicoesRei(TAB,POSICAOB,POSICAOP):-
        getPosicaoRei(branco,POSICAOB,TAB),
        getPosicaoRei(preto,POSICAOP,TAB).

getPosicaoRei(CORREI,{PL,PC},[LINHA|_]) :-
    member({PL,PC,k,CORREI},LINHA).

getPosicaoRei(CORREI,{PL,PC},[_|T]) :-
  getPosicaoRei(CORREI,{PL,PC},T).

mexerPecaBase({PL,PC,TIPO,JOGADOR},{FL,FC},TAB,L):-
        consumirPecaBase({PL,PC,TIPO,JOGADOR},{FL,FC},TAB,L,CONSUMIU),
        CONSUMIU>0.

mexerPecaBase({PL,PC,TIPO,JOGADOR},{FL,FC},TAB,L):-
        obterPecasTabuleiro(TAB,PECAS),
        \+member({FL,FC,_,_},PECAS),
        mexerPeca({PL,PC,TIPO,JOGADOR},{FL,FC},TAB,L2),
        apagarPeca({PL,PC,TIPO,JOGADOR},L2,L,1).

mexerPeca(PECA,TARGETPOSITION,TAB,L2):-
        mexerPecaRecurse(PECA,TARGETPOSITION,TAB,L2,_).

mexerPecaRecurse(_,_,[],[],8).

mexerPecaRecurse(PECA,TARGETPOSITION,[H|T],L2,LINHA):-
        mexerPecaRecurse(PECA,TARGETPOSITION,T,L3,LINHA2),
        LINHA is LINHA2-1,
        mexerPecaRecurseRecurse(PECA,TARGETPOSITION,H,L4,LINHA2,_),
        append([L4],L3,L2).

mexerPecaRecurseRecurse(_,_,[],[],_,8).

mexerPecaRecurseRecurse({PL,PC,TIPO,JOGADOR},{FL,FC},[H|T],L,LINHA,COLUNA):-
        mexerPecaRecurseRecurse({PL,PC,TIPO,JOGADOR},{FL,FC},T,L2,LINHA,COLUNA2),
        COLUNA is COLUNA2-1,
        mexerPecaRecurseRecurseSet({PL,PC,TIPO,JOGADOR},{FL,FC},LINHA,COLUNA2,H,NEWPIECE),
        append([NEWPIECE],L2,L).

mexerPecaRecurseRecurseSet({_,_,TIPO,JOGADOR},{FL,FC},LINHA,COLUNA,{},{FL,FC,TIPO,JOGADOR}):-
        LINHA=FL,
        COLUNA=FC.

mexerPecaRecurseRecurseSet(_,_,_,_,H,H).

consumirPecaBase({PL,PC,TIPO,JOGADOR},{FL,FC},TAB,L,CONSUMIU):-
        consumirPeca({PL,PC,TIPO,JOGADOR},{FL,FC},TAB,L2,CONSUMIU),
        apagarPeca({PL,PC,TIPO,JOGADOR},L2,L,CONSUMIU).

apagarPeca(_,L,L,0).

apagarPeca(_,[],[],_).

apagarPeca({PL,PC,TIPO,JOGADOR},[H|T],L,CONSUMIU):-
        CONSUMIU>0,
        apagarPeca({PL,PC,TIPO,JOGADOR},T,L2,CONSUMIU),
        apagarPecaRecurse({PL,PC,TIPO,JOGADOR},H,H2),
        append([H2],L2,L).

apagarPecaRecurse(_,[],[]).
        
%Goes through columns
apagarPecaRecurse({PL,PC,TIPO,JOGADOR},[H|T],L):-
        apagarPecaRecurse({PL,PC,TIPO,JOGADOR},T,L2),
        apagarPecaRecurseSubstitute({PL,PC,TIPO,JOGADOR},H,NEWPIECE),
        append([NEWPIECE],L2,L).
        
apagarPecaRecurseSubstitute({PL,PC,_,_},{CL,CC,_,_},{}):-
        CL=PL,
        PC=CC.
        
apagarPecaRecurseSubstitute(_,H,H).

consumirPeca(_,_,[],[],0).

%Goes through lines
consumirPeca({PL,PC,TIPO,JOGADOR},{FL,FC},[H|T],L,CONSUMIU):-
        consumirPeca({PL,PC,TIPO,JOGADOR},{FL,FC},T,L2,CONSUMIU1),
        consumirPecaRecurse({PL,PC,TIPO,JOGADOR},{FL,FC},H,H2,CONSUMIU2),
        CONSUMIU is CONSUMIU1+CONSUMIU2,
        append([H2],L2,L).

consumirPecaRecurse(_,_,[],[],0).
        
%Goes through columns
consumirPecaRecurse({PL,PC,TIPO,JOGADOR},{FL,FC},[H|T],L,CONSUMIU):-
        consumirPecaRecurse({PL,PC,TIPO,JOGADOR},{FL,FC},T,L2,CONSUMIU2),
        consumirPecaRecurseSubstitute({PL,PC,TIPO,JOGADOR},{FL,FC},H,NEWPIECE,CONSVAL),
        CONSUMIU is CONSUMIU2+CONSVAL,
        append([NEWPIECE],L2,L).
        
consumirPecaRecurseSubstitute({_,_,TIPO,JOGADOR},{FL,FC},{CL,CC,TIPO2,JOGADOR2},{FL,FC,TIPO,JOGADOR},1):-
        CL=FL,
        FC=CC,
        JOGADOR\=JOGADOR2,
        TIPO2\=k,
        TIPO\=k.
        
consumirPecaRecurseSubstitute(_,_,H,H,0).
        
%Resultado: true se nao existir intersecao
validarIntersecaoEntrePecasBase(PECA,PF,TAB):-
        obterPecasTabuleiro(TAB,PECAS),
        validarIntersecaoEntrePecas(PECA,PF,PECAS).

obterPecasTabuleiro([],[]).

obterPecasTabuleiro([H|T],PECAS):-
        obterPecasTabuleiro(T,PECAS1),
        obterPecasTabuleiroRecurse(H,PECAS2),
        append(PECAS1,PECAS2,PECAS).

obterPecasTabuleiroRecurse([],[]).

obterPecasTabuleiroRecurse([H|T],PECAS):-
        obterPecasTabuleiroRecurse(T,PECAS1),
        setPecaEmLista(H,PECAS2),
        append(PECAS1,PECAS2,PECAS).

setPecaEmLista({A,B,C,D},[{A,B,C,D}]).

setPecaEmLista({},[]).

%true se nao existir intersecao
validarIntersecaoEntrePecas({PL,PC,TIPO,_},{FL,FC},PECAS):-
       validarConsumoEntrePecasRecurse({PL,PC,TIPO,_},{FL,FC},PECAS).

validarIntersecaoEntrePecas({_,_,c,_},{_,_},_).

validarConsumoEntrePecasRecurse(_,_,[]).

validarConsumoEntrePecasRecurse({PL,PC,TIPO,_},{FL,FC},[{CL,CC,_,_}|T]):-
        \+validarPontoNaLinha(PL,PC,CL,CC,FL,FC),
        validarConsumoEntrePecasRecurse({PL,PC,TIPO,_},{FL,FC},T).

validarPontoNaLinha(PL,PC,CL,CC,FL,FC):-
        validarLinha(PL,PC,CL,CC,FL,FC).

validarPontoNaLinha(PL,PC,CL,CC,FL,FC):-
        validarLinhaHorizontal(PL,PC,CL,CC,FL,FC).

validarPontoNaLinha(PL,PC,CL,CC,FL,FC):-
        validarLinhaVertical(PL,PC,CL,CC,FL,FC).

%Tanto faz utilizar xcomo y, desde que nÃ£o sejam zero!
validarLinha(PL,PC,CL,CC,FL,FC):-
        NUMERADOR1 is CC-PC, % Linha Horizontal
        DIVISOR1 is FC-PC,   % Linha Horizontal
        NUMERADOR is CL-PL,
        DIVISOR is FL-PL,
        number(DIVISOR),
        DIVISOR\=0,
        DIVISOR1\=0,
        ALPHA1 is NUMERADOR1/DIVISOR1,
        ALPHA is NUMERADOR/DIVISOR,
        ALPHA1=ALPHA,
        ALPHA>0,
        ALPHA<1.
        
% X = P+ALPHA*(Q-P)
validarLinhaVertical(PL,PC,CL,_,FL,FC):-
        NUMERADOR is CL-PL,
        DIVISOR is FL-PL,
        DIFFH is FC-PC,
        DIVISOR\=0,
        DIFFH=0,
        ALPHA is NUMERADOR/DIVISOR,
        ALPHA>0,
        ALPHA<1.

% X = P+ALPHA*(Q-P)
validarLinhaHorizontal(PL,PC,_,CC,FL,FC):-
        NUMERADOR is CC-PC,
        DIVISOR is FC-PC,
        DIFFV is FL-PL,
        DIVISOR\=0,
        DIFFV=0,
        ALPHA is NUMERADOR/DIVISOR,
        ALPHA>0,
        ALPHA<1.

validarDentroTabuleiro(PL,PC):-
        PL>=1,
        PL=<8,
        PC>=1,
        PC=<8.

validarPecaIntroduzidaJogador(TAB,PL,PC,JOGADOR,{PL,PC,TIPO,JOGADOR}):-
        obterPecasTabuleiro(TAB,PECAS),
        member({PL,PC,TIPO,JOGADOR},PECAS).

validarMovimento({PL,PC,TIPO,_},{FL,FC}):-
        PL\=FL,
        validarMovimentoSub({PL,PC,TIPO},{FL,FC}).

validarMovimento({PL,PC,TIPO,_},{FL,FC}):-
        PC\=FC,
        validarMovimentoSub({PL,PC,TIPO},{FL,FC}).

validarMovimentoSub({PL,PC,t},{FL,FC}):-
        validarMovimentoTorre(PL,PC,FL,FC).

validarMovimentoSub({PL,PC,q},{FL,FC}):-
        validarMovimentoRainha(PL,PC,FL,FC).

validarMovimentoSub({PL,PC,k},{FL,FC}):-
        validarMovimentoRei(PL,PC,FL,FC).

validarMovimentoSub({PL,PC,b},{FL,FC}):-
        validarMovimentoBispo(PL,PC,FL,FC).

validarMovimentoSub({PL,PC,c},{FL,FC}):-
        validarMovimentoCavalo(PL,PC,FL,FC).

validarMovimentoCavalo(PL,PC,FL,FC):-
        AX is abs(PC-FC),
        AY is abs(PL-FL),
        validarMovimentoCavaloSub(AX,AY).

validarMovimentoCavaloSub(AX,AY):-AX=1,AY=2.

validarMovimentoCavaloSub(AX,AY):-AX=2,AY=1.

validarMovimentoRei(PL,PC,FL,FC):-
        validarMovimentoVerticalHorizontal(PL,PC,FL,FC),
        AX is abs(FC-PC),
        AY is abs(FL-PL),
        validarVHRei(AX,AY).

validarMovimentoRei(PL,PC,FL,FC):-
        validarMovimentoDiagonal(PL,PC,FL,FC),
        AX is abs(FC-PC),
        AY is abs(FL-PL),
        validarDGRei(AX,AY).

validarDGRei(AX,AX):-AX=1.

validarVHRei(AX,AY):-AX=0,AY=1.

validarVHRei(AX,AY):-AX=1,AY=0.

validarMovimentoTorre(PL,PC,FL,FC):-validarMovimentoVerticalHorizontal(PL,PC,FL,FC).

validarMovimentoRainha(PL,PC,FL,FC):-validarMovimentoVerticalHorizontal(PL,PC,FL,FC).

validarMovimentoRainha(PL,PC,FL,FC):-validarMovimentoDiagonal(PL,PC,FL,FC).

validarMovimentoBispo(PL,PC,FL,FC):-validarMovimentoDiagonal(PL,PC,FL,FC).

validarMovimentoVerticalHorizontal(PL,PC,FL,FC):-
        X is FC-PC,
        Y is FL-PL,
        validarMovimentoVH(X,Y).

validarMovimentoVH(X,Y):-
        X=0,Y\=0.
validarMovimentoVH(X,Y):-
        X\=0,Y=0.

validarMovimentoDiagonal(PL,PC,FL,FC):-
        X is FC-PC,
        Y is FL-PL,
        AX is abs(X),
        AY is abs(Y),
        AX=AY.

% Selecciona o modo de jogo
selecionarModoJogo :-
        repeat,
        read(Action),
        Action > 0,
        Action < 6,
        modoJogo(Action).

% humano vs humano
modoJogo(1) :-
        comecarCorridaReis(T),
        startPvP(T,branco).

% computador vs humanos
modoJogo(2) :-
        comecarCorridaReis(T),
        lerNivelJogo(NIVEL,1),
        startPCvP(T,branco,NIVEL,humano).

% computador vs computador
modoJogo(3) :-
        comecarCorridaReis(T),
        lerNivelJogo(NIVEL1,1), % computador 1 - jogador branco
        lerNivelJogo(NIVEL2,2), % computador 2 - jogador preto
        startPCvPC(T,branco,NIVEL1,NIVEL2).

% menu de ajuda
modoJogo(4) :-
        imprimirMenuAjuda,
        repeat,
        read(Action),
        Action=1,
        iniciarJogo.

% sair
modoJogo(5) :-
        imprimirMenuExit.

modoJogo(_) :-
        write('Introduza uma opção válida!').

lerNivelJogo(NIVEL,C):-
        write('Escolha um nível de jogo para o computador '), write(C), write(' '), write('[1,2]'),nl,
        read(NIVEL),
        (NIVEL=1;NIVEL=2).

lerNivelJogo(NIVEL,C):-
        lerNivelJogo(NIVEL,C).

iniciarJogo:-
        imprimirMenuInicial,
        write(' Selecione uma opção:'), nl,
        selecionarModoJogo.

% Inicia o jogo Corrida de Reis
comecarCorridaReis(T):-
        inicializarTabuleiro(T).

% Inicializa o tabuleiro com as peças na casa correta
inicializarTabuleiro(
[
[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}],
[{},{},{},{},{},{},{},{}],
[{7,1,k,preto},{7,2,t,preto},{7,3,b,preto},{7,4,c,preto},{7,5,c,branco},{7,6,b,branco},{7,7,t,branco},{7,8,k,branco}],
[{8,1,q,preto},{8,2,t,preto},{8,3,b,preto},{8,4,c,preto},{8,5,c,branco},{8,6,b,branco},{8,7,t,branco},{8,8,q,branco}]
]).
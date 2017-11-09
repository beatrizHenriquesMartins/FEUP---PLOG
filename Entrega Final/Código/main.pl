validarFimJogo(Tabuleiro):-
        validarFim(Tabuleiro,1, JOGADOR),
        write(JOGADOR).

validarFim([H|T], 7, empate):-
        validarEmpate(H,T), !.

validarFim([H|_], 8, JOGADOR):-
        !,
        validarReiLinha(H, JOGADOR).

validarFim([_|T], Count, J):-
        C1 is Count + 1,
        validarFim(T, C1, J).
        
validarEmpate(H,[H1]):-
        !,
        validarReiLinha(H1, branco),
        validarReiLinha(H, preto),
        validarReiPodeMexer(H,H1).

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

validarIntersecaoEntrePecas({PL,PC,TIPO,_},{FL,FC},PECAS):-
       VY is FL-PL,
       VX is FC-PC,
       M is VY/VX,
       \+validarConsumoEntrePecasRecurse({PL,PC,TIPO,_},{FL,FC},PECAS,M).

validarConsumoEntrePecasRecurse(_,_,[],_).

validarConsumoEntrePecasRecurse({PL,PC,TIPO,_},{FL,FC},[{CL,CC,_,_}|T],M):-
        validarConsumoEntrePecasRecurse({PL,PC,TIPO,_},{FL,FC},T,M),
        validarReta(CL,CC,PL,PC,M),
        PL\=FL,
        PC\=FC.
        
validarReta(CL,CC,PL,PC,M):-
        Y is M*(CC+PC)+PL,
        CL=Y.

validarDentroTabuleiro(FL,FC):-
        FL>=1,
        FL=<8,
        FC>=1,
        FC=<8.

validarMovimento({PL,PC,t},{FL,FC}):-
        PL\=FL,
        validarMovimentoSub({PL,PC,t},{FL,FC}).

validarMovimento({PL,PC,t},{FL,FC}):-
        PC\=FC,
        validarMovimentoSub({PL,PC,t},{FL,FC}).

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

validarMovimentoRei(PL,PC,FL,FC):-validarMovimentoVerticalHorizontal(PL,PC,FL,FC),
        AX is abs(FC-PC),
        AY is abs(FL-PL),
        validarVHRei(AX,AY).

validarMovimentoRei(PL,PC,FL,FC):-validarMovimentoDiagonal(PL,PC,FL,FC),
        AX is abs(FC-PC),
        AY is abs(FL-PL),
        validarDGRei(AX,AY).

validarDGRei(AX,AX):-AX=1.

validarVHRei(AX,AY):-AX=0,AY=1.

validarVHRei(AX,AY):-AX=1,AY=0.

validarMovimentoTorre(PL,PC,FL,FC):-validarMovimentoVerticalHorizontal(PL,PC,FL,FC).

validarMovimentoRainha(PL,PC,FL,FC):-validarMovimentoVerticalHorizontal(PL,PC,FL,FC),validarMovimentoDiagonal(PL,PC,FL,FC).

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
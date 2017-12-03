% Jogo Random

gerarTabuleiro([],_,[]).

gerarTabuleiro([_|T1],TAMANHO,[H|T]):-
        length(H,TAMANHO),
        gerarTabuleiro(T1,TAMANHO,T).
        
gerarTabuleiro(TAMANHO,TAB):-
        length(TAB1,TAMANHO),
        gerarTabuleiro(TAB1,TAMANHO,TAB).

inicializarTabuleiroRandomColuna([],[],_,_,_,_).

inicializarTabuleiroRandomColuna([_|T],[-1|T1],NLINHA/NCOLUNA,LF/CF,NLINHA,NCOLUNA):-
        NCOLUNA1 is NCOLUNA + 1,
        inicializarTabuleiroRandomColuna(T,T1,NLINHA/NCOLUNA,LF/CF,NLINHA,NCOLUNA1), !.   

inicializarTabuleiroRandomColuna([_|T],[-1|T1],LI/CI,NLINHA/NCOLUNA,NLINHA,NCOLUNA):-
        NCOLUNA1 is NCOLUNA + 1,
        inicializarTabuleiroRandomColuna(T,T1,LI/CI,NLINHA/NCOLUNA,NLINHA,NCOLUNA1), !.

inicializarTabuleiroRandomColuna([_|T],[0|T1],LI/CI,LF/CF,NLINHA,NCOLUNA):-
        NCOLUNA1 is NCOLUNA + 1,
        inicializarTabuleiroRandomColuna(T,T1,LI/CI,LF/CF,NLINHA,NCOLUNA1).         
        
inicializarTabuleiroRandomLinha([],[],_,_,_).

inicializarTabuleiroRandomLinha([H|T],[H1|T1],LI/CI,LF/CF,NLINHA):-
        inicializarTabuleiroRandomColuna(H,H1,LI/CI,LF/CF,NLINHA,1),
        NLINHA1 is NLINHA + 1,
        inicializarTabuleiroRandomLinha(T,T1,LI/CI,LF/CF,NLINHA1).

inicializarTabuleiroRandom(TAB,LI/CI,LF/CF,TAB1):-
        inicializarTabuleiroRandomLinha(TAB,TAB1,LI/CI,LF/CF,1).
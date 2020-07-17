carrinho(8, 1). % carrinho(Hor, Ver)
carrinho(3, 2).
carrinho(7, 3).
carrinho(3, 4).
carrinho(4, 5).

escada(2, 1). % escada(Hor, Ver)
escada(9, 1).
escada(10, 1).
escada(6, 2).
escada(1, 3).
escada(8, 3).
escada(1, 4).
escada(9, 4).

obstaculo(X, Y) :- carrinho(X, Y); X < 1; X > 10.


% Captura o fugitivo
consegue(estado(Hor, Ver), estado(Hor, Ver), R, R).


% Escadas
consegue(estado(PHor, PVer), estado(LHor, LVer), SoFar, R) :-
  PVer_new is PVer + 1, escada(PHor, PVer),
  \+ memberchk( estado(PHor, PVer), SoFar ),
  consegue(estado(PHor, PVer_new), estado(LHor, LVer), [estado(PHor, PVer) | SoFar], R).
consegue(estado(PHor, PVer), estado(LHor, LVer), SoFar, R) :-
  PVer_new is PVer - 1, escada(PHor, PVer_new),
  \+ memberchk( estado(PHor, PVer), SoFar ),
  consegue(estado(PHor, PVer_new), estado(LHor, LVer), [estado(PHor, PVer) | SoFar], R).

% Pular Carrinho
consegue(estado(PHor, PVer), estado(LHor, LVer), SoFar, R) :-
   PHor_Next is PHor + 1, carrinho(PHor_Next, PVer),
   PHor_new is PHor + 2, PHor_new \= LHor, not(obstaculo(PHor_new, PVer)), not(escada(PHor_new, PVer)),
   \+ memberchk( estado(PHor, PVer), SoFar ),
   consegue(estado(PHor_new, PVer), estado(LHor, LVer), [estado(PHor, PVer) | SoFar], R).
consegue(estado(PHor, PVer), estado(LHor, LVer), SoFar, R) :-
   PHor_Next is PHor - 1, carrinho(PHor_Next, PVer),
   PHor_new is PHor - 2, PHor_new \= LHor, not(obstaculo(PHor_new, PVer)), not(escada(PHor_new, PVer)),
   \+ memberchk( estado(PHor, PVer), SoFar ),
   consegue(estado(PHor_new, PVer), estado(LHor, LVer), [estado(PHor, PVer) | SoFar], R).


% Mover Horizontal
consegue(estado(PHor, PVer), estado(LHor, LVer), SoFar, R) :-
  PHor_new is PHor + 1, not(obstaculo(PHor_new, PVer)),
  \+ memberchk( estado(PHor, PVer), SoFar ),
  consegue(estado(PHor_new, PVer), estado(LHor, LVer), [estado(PHor, PVer) | SoFar], R).
consegue(estado(PHor, PVer), estado(LHor, LVer), SoFar, R) :-
  PHor_new is PHor - 1, not(obstaculo(PHor_new, PVer)),
  \+ memberchk( estado(PHor, PVer), SoFar ),
  consegue(estado(PHor_new, PVer), estado(LHor, LVer), [estado(PHor, PVer) | SoFar], R).

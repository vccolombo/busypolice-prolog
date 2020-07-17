carrinho(7, 1). % carrinho(Hor, Ver)
carrinho(7, 2).
carrinho(7, 3).
carrinho(7, 4).
carrinho(7, 5).

escada(9, 1). % escada(Hor, Ver)
escada(2, 2).
escada(10, 3).
escada(4, 3).
escada(6, 4).


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

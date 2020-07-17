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

evidencia(1,5).
evidencia(1,4).
evidencia(1,3).

obstaculo(X, Y) :- carrinho(X, Y); X < 1; X > 10.


% Captura o fugitivo
consegue(estado(Hor, Ver, Ev), estado(Hor, Ver), R, R) :- length(Ev, 3).

% Evidências
consegue(estado(PHor, PVer, Ev), estado(LHor, Lver), SoFar, R) :-
  evidencia(PHor, PVer), \+ memberchk(evidencia(PHor, PVer), Ev),
  \+ memberchk( estado(PHor, PVer, Ev), SoFar ),
  consegue(estado(PHor, PVer, [evidencia(PHor, PVer) | Ev]), estado(LHor, Lver), [estado(PHor, PVer, Ev) | SoFar], R).

% Escadas
consegue(estado(PHor, PVer, Ev), estado(LHor, Lver), SoFar, R) :-
  PVer_new is PVer + 1, escada(PHor, PVer),
  \+ memberchk( estado(PHor, PVer, Ev), SoFar ),
  consegue(estado(PHor, PVer_new, Ev), estado(LHor, Lver), [estado(PHor, PVer, Ev) | SoFar], R).
consegue(estado(PHor, PVer, Ev), estado(LHor, Lver), SoFar, R) :-
  PVer_new is PVer - 1, escada(PHor, PVer_new),
  \+ memberchk( estado(PHor, PVer, Ev), SoFar ),
  consegue(estado(PHor, PVer_new, Ev), estado(LHor, Lver), [estado(PHor, PVer, Ev) | SoFar], R).

% Pular Carrinho
consegue(estado(PHor, PVer, Ev), estado(LHor, Lver), SoFar, R) :-
   PHor_Next is PHor + 1, carrinho(PHor_Next, PVer),
   PHor_new is PHor + 2, PHor_new \= LHor, not(obstaculo(PHor_new, PVer)), not(escada(PHor_new, PVer)), not(evidencia(PHor_new, PVer)),
   \+ memberchk( estado(PHor, PVer, Ev), SoFar ),
   consegue(estado(PHor_new, PVer, Ev), estado(LHor, Lver), [estado(PHor, PVer, Ev) | SoFar], R).
consegue(estado(PHor, PVer, Ev), estado(LHor, Lver), SoFar, R) :-
   PHor_Next is PHor - 1, carrinho(PHor_Next, PVer),
   PHor_new is PHor - 2, PHor_new \= LHor, not(obstaculo(PHor_new, PVer)), not(escada(PHor_new, PVer)), not(evidencia(PHor_new, PVer)),
   \+ memberchk( estado(PHor, PVer, Ev), SoFar ),
   consegue(estado(PHor_new, PVer, Ev), estado(LHor, Lver), [estado(PHor, PVer, Ev) | SoFar], R).

% Mover Horizontal
consegue(estado(PHor, PVer, Ev), estado(LHor, Lver), SoFar, R) :-
  PHor_new is PHor + 1, not(obstaculo(PHor_new, PVer)),
  \+ memberchk( estado(PHor, PVer, Ev), SoFar ),
  consegue(estado(PHor_new, PVer, Ev), estado(LHor, Lver), [estado(PHor, PVer, Ev) | SoFar], R).
consegue(estado(PHor, PVer, Ev), estado(LHor, Lver), SoFar, R) :-
  PHor_new is PHor - 1, not(obstaculo(PHor_new, PVer)),
  \+ memberchk( estado(PHor, PVer, Ev), SoFar ),
  consegue(estado(PHor_new, PVer, Ev), estado(LHor, Lver), [estado(PHor, PVer, Ev) | SoFar], R).

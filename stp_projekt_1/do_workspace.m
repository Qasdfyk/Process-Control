clear
% Odpowiednie komendy żeby w workspace były parametry

[A, B, C, D] = tf2ss([0, 1, 4, 3], [1, 19/2, 29, 28]);

sb = -3;
K = acker(A, B, [sb, sb, sb]);
% Obliczanie macierzy L
s0 = -10;
L = acker(A', C', [s0, s0, s0]);

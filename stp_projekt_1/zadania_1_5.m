clear
% Poniżej realizuje punkty 1,2,3,4 z zadania projektowego

% Współczynniki w liczniku i mianowniku transmitancji
syms s;
licznik=expand((s+1)*(s+3));
mianownik=expand((s+2)*(s+3.5)*(s+4));
% Transmitancja -> przestrzeń stanu
[A, B, C, D] = tf2ss([1, 4, 3], [1, 19/2, 29, 28]);

% Przestrzeń stanu -> Transmitancja
[NUM, DEN] = ss2tf(A, B, C, D);

% Obliczanie symbolicznie
syms s;
G = C*(s*eye(length(A))-A)^-1*B + D;

% Obliczanie K
sb = -2.5;
K = acker(A, B, [sb, sb, sb]);

% Obliczanie macierzy L oraz równań obserwatora
s0 = -2.5;
L = acker(A', C', [s0, s0, s0]);
L1 = L(1);
L2 = L(2);
L3 = L(3);
syms s L1 L2 L3 x1 x2 x3 u y;
x = A*[x1;x2;x3] + B*u + [L1;L2;L3]*(y-C*[x1;x2;x3]);

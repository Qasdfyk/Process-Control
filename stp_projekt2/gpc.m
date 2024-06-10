zad1;
close all;
% parametry symulacji
tmax = 100;

% wartosci wyjsciowe 
wyu = 0;
wyy = 0;

% horyzonty
D = 79; N = 20; Nu = 2;

% współczynnik kary
lambda = 10;

% wspolczynniki s
s = step(Gz);
s(1) = []; % uwzględniając opóźnienie

% Konstrukcja macierzy M dla GPC
M = zeros(N, Nu);
for i = 1:N
    for j = 1:Nu
        if i >= j
            M(i, j) = s(i-j+1);
        end
    end
end

%parametry regulatora
I = eye(Nu);
K = (M' * M + lambda * I) \ M';

a1 = Gz.Denominator{1}(2); 
a0 = Gz.Denominator{1}(3);
b1 = Gz.Numerator{1}(2); 
b0 = Gz.Numerator{1}(3);

% obliczanie Gz drugi raz w celu wyznaczenia obszarów stablinosci
% Ko = 6.028;
% To = 10;
% zmienna pomocnicza (normalnie rowna 0) - zwiększamy o 1 przy każdym
% zwiekszeniu To o 0.5 (dla To=5.5 pom=1)
pom = 0;

Gs = tf(Ko,conv([T1 1], [T2 1]),'inputdelay',To);
Gz = c2d(Gs, Tp, 'zoh');

% zapisywanie wyników (To, Ko) dla gpc
% (5, 6.7391) (5.5, 6.8682) (6, 6.9648) (6.5, 6.755) (7, 6.498) (7.5, 6.3) (8, 6.162) 
% (8.5, 6.073) (9, 6.026) (9.5, 6.014) (10, 6.028)

% nowe parametry obiektu
a1_new = Gz.Denominator{1}(2); 
a0_new = Gz.Denominator{1}(3);
b1_new = Gz.Numerator{1}(2); 
b0_new = Gz.Numerator{1}(3);

% warunki początkowe
y(1:12+pom) = 0;
u(1:12+pom) = 0;
yzad=1;

% inicjalizacja zakłóceń
zaklocenia(1:40) = 0;
zaklocenia(41: tmax) = 0.05;
d = zeros(1, tmax);

%główna pętla programu
for k = (13+pom):tmax
    y(k) = b1_new*u(k-11-pom)+b0_new*u(k-12-pom)-a1*y(k-1)-a0*y(k-2);%+ zaklocenia(k)

    d(k) = y(k) - (b1*u(k-11-pom)+b0*u(k-12-pom)-a1*y(k-1)-a0*y(k-2));

    y_0 = zeros(1, N);

    % obliczanie odpowiedzi swobodnej
    y_0(1) = -a1*y(k) - a0*y(k-1) + b1*u(k-10-pom) + b0*u(k-11-pom) + d(k);
    y_0(2) = -a1*y_0(1) - a0*y(k) + b1*u(k-9-pom) + b0*u(k-10-pom) + d(k);
    for p=3:N
        if p <= 10
            y_0(p) = -a1*y_0(p-1) - a0*y_0(p-2) + b1*u(k-11+p) + b0*u(k-12+p) + d(k);
        else
            y_0(p) = -a1*y_0(p-1) - a0*y_0(p-2) + b1*u(k-1) + b0*u(k-1) + d(k);
        end
    end
    % obliczanie delta uk
    deltauk = K(1, :)*(yzad*ones(1, N) - y_0)';

    % obliczanie sygnalu sterujacego
    u(k) = u(k-1) + deltauk;

    wyu_gpc(k) = u(k);
    wyy_gpc(k) = y(k);
end

figure;
stairs(0:tmax, [0 wyu_gpc]); hold on; grid on;
xlabel('k'); ylabel('u');

figure;
stairs(0:tmax, [0 yzad*ones(1, tmax)]);
hold on; grid on;
stairs(1:tmax, wyy_gpc);
xlabel('k'); ylabel('y, y_{zad}');

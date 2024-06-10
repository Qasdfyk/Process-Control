zad1;
close all;
% parametry symulacji
tmax = 80;

% wartosci wyjsciowe 
wyu = 0;
wyy = 0;

% horyzonty
D = 79; N = 79; Nu = 79;

% wspolczynniki s
sv = step(Gz);
sv(1) = []; % uwzględniając opóźnienie

%obliczanie Gz drugi raz w celu wyznaczenia obszarów stablinosci
Ko = 4.7;
To = 5;
% zmienna pomocnicza (normalnie rowna 0)
pom = 0;

%nowe transmitanje
Gs = tf(Ko,conv([T1 1], [T2 1]),'inputdelay',To);
Gz = c2d(Gs, Tp, 'zoh');

% zapisywanie wyników (To, Ko) dla dmc
% (5, 10.08) (5.5, 9.81) (6, 9.43) (6.5, 8.98) (7, 8.51) (7.5, 8.06) (8, 7.64) 
% (8.5, 6.64) (9, 5.88) (9.5, 5.44) (10, 5.25)


% parametry obiektu
a1 = Gz.Denominator{1}(2); 
a0 = Gz.Denominator{1}(3);
b1 = Gz.Numerator{1}(2); 
b0 = Gz.Numerator{1}(3);

% współczynnik kary
lambda = 10;

% warunki początkowe
y(1:12+pom) = 0;
u(1:12+pom) = 0;
y_zad=1;

for i=1:D-1
    deltaupk(i)=0;
end


% macierz M
M = zeros(N, Nu);
for i = 1:N
    for j = 1:Nu
        if i-j+1 > 0
            M(i, j) = sv(i-j+1);
        end
    end
end

% macierz Mp
Mp = zeros(N, D-1);
for i = 1:N
    for j = 1:D-1
        if j + i <= D
            Mp(i, j) = sv(i+j) - sv(j);
        else
            Mp(i, j) = sv(D) - sv(j);
        end
    end
end

% obliczenie parametrów regulatora
I = eye(Nu);
K = inv((M'*M + lambda*I))*M';
Ku = K(1,:)*Mp;
Ke = sum(K(1,:));

zaklocenia(1:40) = 0;
zaklocenia(41: tmax) = 0.05;
% główna pętla programu
for k=(13+pom):tmax
    % obiekt
    y(k) = b1*u(k-11-pom)+b0*u(k-12-pom)-a1*y(k-1)-a0*y(k-2);% + zaklocenia(k)

    % regulator
    ek = y_zad - y(k);

    deltauk = Ke*ek-Ku*deltaupk';
    for n=D-1:-1:2
        deltaupk(n)=deltaupk(n-1);
    end
    deltaupk(1)=deltauk;
    u(k) = u(k-1)+deltaupk(1);

    wyu(k) = u(k);
    wyy(k) = y(k);
end

% wizualizacja działania programu
figure(1);
stairs(0:tmax, [0 wyu]);hold on; grid on;
xlabel('k'); ylabel('u');
figure(2);
stairs(0:tmax, [0 y_zad*ones(1, tmax)]);
hold on; grid on;
stairs(1:tmax, wyy);
xlabel('k'); ylabel('y, y_{zad}');

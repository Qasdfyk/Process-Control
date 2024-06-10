% regulator PID dyskretny
% zadanie 4
clear
zad1; ciagly_pid;
close all;

%fragment kodu do wyznaczania obszaru stablinosci
% Ko = 7.6;
% To = 8;
% zmienna pomocnicza
pom = 0;
% zapisywanie wyników (To, Ko) dla pida
% (5, 7.5) (5.5, 7.15) (6, 6.85) (6.5, 6.57) (7, 6.3) (7.5, 6.05) (8, 5.85) 
% (8.5, 5.65) (9, 5.44) (9.5, 5.235) (10, 5.065)
Gs = tf(Ko,conv([T1 1], [T2 1]),'inputdelay',To);
Gz = c2d(Gs, Tp, 'zoh');


% inicjalizacja
kk = 200; 
a1 = Gz.Denominator{1}(2); 
a0 = Gz.Denominator{1}(3);
b1 = Gz.Numerator{1}(2); 
b0 = Gz.Numerator{1}(3);

% warunki początkowe
u(1:12+pom) = 0; 
y(1:12+pom) = 0;
e(1:12+pom) = 0;
yzad(1:14+pom) = 0;
yzad(13+pom:kk) = 1;

% głowna petla
for k = (13+pom):kk
    y(k) = b1*u(k-11-pom)+b0*u(k-12-pom)-a1*y(k-1)-a0*y(k-2);

    e(k) = yzad(k)-y(k);

    u(k) = r2*e(k-2)+r1*e(k-1)+r0*e(k)+u(k-1);
end

% wyniki symulacji

figure;
stairs(u);
title('Sygnał sterujący');
xlabel('k');
ylabel('u'); 

figure;
stairs(y);
hold on;
stairs(yzad,':');
title('Wyjście na tle wartości zadanej');
xlabel('k');
ylabel('y');
legend('y', 'yzad');


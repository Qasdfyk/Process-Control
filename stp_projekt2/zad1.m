% parametry z zadania
Ko = 4.7;
To = 5;
T1 = 1.83;
T2 = 5.45;
Tp = 0.5; 
 
% wyznaczenie transmitancji
Gs = tf(Ko,conv([T1 1], [T2 1]),'inputdelay',To);
Gz = c2d(Gs, Tp, 'zoh');

% plot
step(Gs, '-', Gz, '--');
legend('Continuous', 'Discrete', Location='northwest');
title('Porównanie odpowiedzi skokowej transmitancji ciągłej i dyskretnej');
xlabel('Czas [s]');
ylabel('Amplituda');

% wzmocnienia statyczne
K_stat_continuous = dcgain(Gs);
K_stat_discrete = dcgain(Gz);

% disp(['Współczynnik wzmocnienia statycznego transmitancji ciągłej: ', num2str(K_stat_continuous)]);
% disp(['Współczynnik wzmocnienia statycznego transmitancji dyskretnej: ', num2str(K_stat_discrete)]);


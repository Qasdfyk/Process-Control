% zadanie 3
% regulator PID ciagly
clear
ziegler_nichols;
close all;
% nastawy
Kr = 0.6 * Kkryt; Ti = 0.5 * Tkryt; Td = 0.12 * Tkryt;

% regulator PID ciagly z dobranymi nastawami 

% model
s = tf('s');
sys = (Ko*exp(-To*s))/((T1*s+1)*(T2*s+1));
% regulator P
C0 = pidstd(Kr, Ti, Td);
% odpowiedz skokowa
C1 = feedback(C0*sys, 1);
step(C1, 80)
title('Odpowiedź skokowa');
xlabel('czas');
ylabel('y'); 

% wspolczynniki r
r2 = Kr * Td / Tp;
r1 = Kr * (Tp/(2*Ti)-2*Td/Tp-1);
r0 = Kr * (1+Tp/(2*Ti)+Td/Tp);

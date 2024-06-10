% zadanie 3
% regulator P ciagly
zad1;
close all;
% nastawy regulatora P, ktore daja oscylacje niegasnące
Kkryt = 0.48812; Ti = inf; Td = 0;

% model
s = tf('s');
sys = (Ko*exp(-To*s))/((T1*s+1)*(T2*s+1));

% pid
C0 = pidstd(Kkryt, Ti, Td);

% wykres
C1 = feedback(C0*sys, 1);
step(C1)
Tkryt = 20;
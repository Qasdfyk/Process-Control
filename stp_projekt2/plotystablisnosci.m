%%%%%% Dla PID
% wartosci do stabilnosci
x = [5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10];
y = [7.5, 7.15, 6.85, 6.57, 6.3, 6.05, 5.85, 5.65, 5.44, 5.235, 5.065];

x = x / 5;
y = y / 4.7;

% Create the plot
figure(1);
plot(x, y, 'o-', 'LineWidth', 2, 'MarkerSize', 8);
grid on; hold on;

% Label the axes
xlabel('T_o/(T_o)_{nom}', 'Interpreter', 'tex');
ylabel('K_o/(K_o)_{nom}', 'Interpreter', 'tex');

title('Obszar stabilności dla regulatora PID');

xlim([min(x)-0.1, max(x)+0.1]);
ylim([min(y)-0.1, max(y)+0.1]);

%%%%% DLa DMC

% wartosci do stabilnosci
x = [5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10];
y = [10.08, 9.81, 9.43, 8.98, 8.51, 8.06, 7.64, 6.64, 5.88, 5.44, 5.25];

x = x / 5;
y = y / 4.7;

% Create the plot
figure(2);
plot(x, y, 'o-', 'LineWidth', 2, 'MarkerSize', 8);
grid on;

% Label the axes
xlabel('T_o/(T_o)_{nom}', 'Interpreter', 'tex');
ylabel('K_o/(K_o)_{nom}', 'Interpreter', 'tex');

title('Obszar stabilności dla regulatora DMC');

xlim([min(x)-0.1, max(x)+0.1]);
ylim([min(y)-0.1, max(y)+0.1]);



%%%%% DLa GPC
% wartosci do stabilnosci
x = [5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10];
% y = [6.73, 6.4424, 6.1711, 5.9191, 5.6881, 5.4786, 5.29, 5.1211, 4.9698, 4.8343, 4.7126];
y = [6.7391, 6.8682, 6.9648, 6.755, 6.498, 6.3, 6.162, 6.073, 6.026, 6.014, 6.028];

x = x / 5;
y = y / 4.7;

figure(3);
plot(x, y, 'o-', 'LineWidth', 2, 'MarkerSize', 8);
grid on;

xlabel('T_o/(T_o)_{nom}', 'Interpreter', 'tex');
ylabel('K_o/(K_o)_{nom}', 'Interpreter', 'tex');


title('Obszar stabilności dla regulatora GPC');

xlim([min(x)-0.1, max(x)+0.1]);
ylim([min(y)-0.1, max(y)+0.1]);
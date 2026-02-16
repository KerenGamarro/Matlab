%% Procesamiento de Señales, Lección 1 - 2026
% Luis Alberto Rivera

%% Ejemplo stem plot

n = 0:10;
x = [2, 1, 1.5, 3.5, 2, 1, 3, 3, 2, 1, 2.5];

figure(1); clf;
% stem(n, x);   % Los círculos salen vacíos.
stem(n, x, 'filled');   % Si se coloca el argumento 'filled',
                        % los círculos salen llenos.


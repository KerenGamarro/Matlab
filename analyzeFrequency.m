%%Comprobacion
%Keren Gamarro 23546
%Seccion 11 de Procesamiento de señales Pedro Castillo
function [isPeriodic, w_periodic, w_alias] = analyzeFrequency(w, N, nPeriods)
% Entradas:
% Donde w es la frecuencia en rads por muestra
% Donde N es un periodo
% Donde nPeriods es el numero de periodos que se quieren graficar

% Salidas:
% Donde isPeriodic es una variable logica de dos valores, true o false
% Donde w_periodic es frecuencia periodica, o lo mas cercano
% Donde w_alias es una frecuencia alias aleatoria distinta de w

%% 1) Generación de la señal x[n] = cos(w n)

% Se define el índice n para graficar nPeriods períodos
n = 0:(nPeriods*N - 1);

% Se genera la señal sinusoidal discreta
x = cos(w*n);

% Se grafica la señal usando stem
figure
stem(n, x, 'filled')
xlabel('n')
ylabel('Amplitud')
title('Señal sinusoidal discreta x[n] = cos(\omega n)')
grid on

%% 2) Determinación de periodicidad

% Una señal cos(w n) es periódica si:
% w / (2*pi) = k / N  donde k debe ser entero

k = w * N / (2*pi);     % Se despeja k
tol = 1e-6;             % Tolerancia numérica

% Se verifica si k es entero usando mod y tolerancia
if abs(mod(k,1)) < tol
    isPeriodic = true;  % La señal es periódica
else
    isPeriodic = false; % La señal NO es periódica
end

%% 3) Frecuencia periódica más cercana

if isPeriodic == true
    % Si ya es periódica, se asigna directamente
    w_periodic = w;
else
    % Si no es periódica, se aproxima k al entero más cercano
    k_round = round(k);
    w_periodic = 2*pi*k_round / N;
end

%% 4) Generación de frecuencia alias aleatoria

% Se genera una frecuencia aleatoria entre 0 y 2*pi
w_alias = 2*pi*rand;

% Se asegura que sea distinta de w
while abs(w_alias - w) < tol
    w_alias = 2*pi*rand;
end

end


%[appendix]{"version":"1.0"}
%---

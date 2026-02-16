%% Procesamiento de Señales - Laboratorio 2, Segunda Parte (b)
%  Pedro Joaquín Castillo, Julio Andrés Ávila
%  Representación de señales discretas

clear       % elimina las variables del Workspace
clc         % limpia la ventana de comandos
close all   % cierra todas las figuras

%% ---------------------------------------------------------------------------------------
% A lo largo del curso, trabajaremos con señales en tiempo discreto.
% Una señal discreta está definida sólo para valores enteros del índice n.
% Por esta razón, NO debe representarse con plot(), sino con stem().

%% Definición del índice discreto
% El índice n representa el "tiempo" discreto.
% Solo toma valores enteros.

n = -5:5;   % índice discreto (puede ser diferente a "n" pero, por convención, se utiliza esta letra)

% Recuerden que el índice discreto toma valores de -inf a +inf para
% señales infinitas. Las señales a trabajar en el laboratorio, por más
% extensas que sean, serán siempre señales finitas.

%% Definición de una señal discreta
% Definimos una señal x[n] de duración finita.

x = [0 0 1 2 3 2 1 0 0 0 0];

%% Representación con stem
% La función stem dibuja una línea vertical para cada muestra,
% indicando que la señal solo existe en los valores enteros de n.

figure(1);
stem(n, x)
xlabel('n')
ylabel('x[n]')
title('Representación de una señal discreta con stem')
grid on

%% Comparación con plot (NO recomendado)
% Si usamos plot(), MATLAB conecta los puntos con líneas,
% lo cual sugiere incorrectamente que la señal es continua.

figure (2);
plot(n, x, '-o')
xlabel('n')
ylabel('x[n]')
title('Representación con plot (no recomendada para señales discretas)')
grid on

%% Observación importante
% Aunque plot() puede usarse para visualizar los valores,
% stem() es la representación correcta para señales discretas,
% ya que enfatiza que cada muestra es independiente.

%% Más ejemplos
% Si no se define el vector de tiempo discreto n, stem() grafica la señal discreta x[n] a partir
% del índice 1 hasta el índice lenght(x)

figure(3); 
Y = linspace(-2*pi,2*pi,50);
stem(Y)  % Notar que el primer "tallo" aparece en n = 1

% Es posible mostrar el gráfico con los puntos "rellenos". 
% Sólo deben agregar el argumento 'filled' al final. 

n = 1:20;
y = (exp(0.25*n));
stem(Y,'filled')


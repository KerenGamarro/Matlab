%% Procesamiento de Señales - Laboratorio 3, Tercera Parte
%  Pedro Joaquín Castillo, Julio Andrés Ávila
%  Ejemplo de función simple

% Notar que el nombre del archivo es el nombre de la función.
% Importante: los nombres de los scripts (archivos .m), ya sea para funciones o no, y de
% las variables, NO deben tener espacios en blanco ni caracteres no ingleses (tildes,
% eñes, etc.). Nombres así dan problemas al correr los scripts o usar las variables.
% 
% Las funciones pueden tener uno o varios argumentos de entrada, y pueden ser de distintos
% tipos (números, vectores, matrices, estructuras, strings, y muchos otros).
% Las funciones pueden tener uno, varios o ningún argumento de salida. También pueden ser
% de distintos tipos.
% Para más detalles, busque "function" en el help de Matlab. 

% Buena práctica: Incluya comentarios describiendo lo que hace la función y qué argumentos
% de entrada y salida tiene.

% Función PS_Lab3_fun1. Ejemplo simple que ilustra cómo se crean funciones en Matlab.
% Entrada:  X - vector con muestras unidimensionales (puede ser fila o columna).

% Salidas:  mu - media de las muestras
%            s - desviación estándar de las muestras
%            M - valor máximo del vector
%            m - valor mínimo del vector
%         Suma - Suma de los elementos del vector
function [mu, s, M, m, Suma] = PS_Lab3_fun1(X)
% Las variables de salida no necesariamente tienen que calcularse en orden.
mu = mean(X);
s = std(X);
M = max(X);
m = min(X);
Suma = sum(X);

end
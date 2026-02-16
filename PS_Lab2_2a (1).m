%% Procesamiento de Señales - Laboratorio 2, Segunda Parte (a)
% Pedro Joaquín Castillo, Julio Andrés Ávila
% Gráficas en Matlab (1)

clear   % elimina las variables del Workspace
clc     % limpia la ventana de comandos

%% Gráficas (1)
% A continuación se crean diversas variables, que luego se graficarán.

% Forma y = f(x). Definimos un vector con los valores de la variable independiente, y
% luego obtenemos los valores de la variable dependiente. Note que los nombres de las
% variables no tienen que ser x o y.
a = -3; b = 3; N = 100;  % Para el intervalo de definición, y el número de puntos a usar
x = linspace(a, b, N);
y1 = 0.05*x.^3 - 0.05*x.^2 + 0.5*x + 1;
y2 = 2*exp(-x.^2);
syms f(t)
f(t) = sin(3*t) + cos(2*t);
y3 = double(f(x));      % Se pudo haber definido y3 = sin(3*x) + cos(2*x);
                        % Se definió la función simbólica, sólo para mostrar que en estas
                        % funciones también se pueden evaluar vectores.

% Paramétricas. Definimos un vector con los valores del parámetro, y luego obtenemos los
% valores de las variables que dependen del parámetro. El parámetro no necesariamente
% tiene que ser llamado t.
a = 0; b = 2*pi; N = 500;
t = linspace(a, b, N);

% 2D
xt1 = cos(t);
yt1 = sin(t).*cos(t);

% 3D. Se pudo definir otro vector t
xt2 = 0.3*cos(t);
yt2 = 0.3*sin(t);
zt2 = t;

% Polares. Se pudo definir distintos vectores t para cada función
r1 = 2 + 3*cos(t);
r2 = 4 - 2*sin(t);
r3 = 5*sin(t);
r4 = 3*cos(3*t);

% Superficies de la forma Z = f(x, y). Podemos definir una "malla" de puntos (x, y), los
% cuales serán evaluados para obtener las imágenes.
[X, Y] = meshgrid(1:0.25:10,1:0.25:20);  % "malla" de puntos a ser evaluados abajo
Z = sin(X) + cos(Y);    % Imágenes de la función ("las alturas"): Z = f(x, y)

%% --- Introducción a la pestaña "PLOTS" -------------------------------------------------
% Usemos la pestaña "PLOTS", arriba. Probemos distintas opciones.
% Note que no todos los tipos de gráficas aplican para todas las variables.
%% ---------------------------------------------------------------------------------------

% También podemos escribir los comandos directamente, como se ilustra a continuación.
% Recuerde apoyarse en el "help" para aprender sobre las funciones, sus parámetros y
% opciones, y para ver ejemplos de cómo usarlas.

% Ejecute las siguientes líneas UNA POR UNA, y vea qué pasa.
figure(1);       % abre la figura 1, o la activa, si ya estaba creada.
plot(x, y1);     % Propiedades por defecto (color, tipo de marcadores, etc.)

plot(x, y2, 'r');  % Note que se reemplaza la gráfica anterior
plot(x, y3, 'g*'); % Note el color y el tipo de marcador usado

grid on;           % Se activa una cuadrícula en la gráfica.
grid off;          % Se desactiva la cuadrícula en la gráfica.
xlabel('eje x');   % Etiqueta al eje x
ylabel('eje y');   % Etiqueta al eje y
xlim([0 3]);       % Se establece el rango que se desea mostrar en el eje x
ylim([-3 3]);      % Se establece el rango que se desea mostrar en el eje y
title('Gráfica usando plot'); % Se puede dar un título a la gráfica

figure(2);
plot(x, y1, 'k');
hold on;    % Para que se mantengan las gráficas, no se vayan reemplazando
plot(x, y2, 'co');
plot(x, y3, 'm--');
legend('y1', 'y2', 'y3'); % Agrega una leyenda. Los nombres no tienen que ser iguales a las variables

hold off;    % Para que ya no se sigan manteniendo las gráficas.

clf;    % Limpia la última figura activa (no es necesario si acaba de abrir la figura)
close;  % Cierra la última figura activa

%% Ejercicio 1 -----------------------------------------------------------------
% Use la función plot para graficar las curvas definidas por xt1, yt1 y por
% xt2 y yt2. Ambas curvas deben mostrarse juntas en una figura (use figure(3)). 
% Agregue los siguientes elementos:
% - Cuadrícula
% - Nombre los ejes
% - Título a la figura
% - Límites de los ejes entre -1 y 1.

% Busque la opción "Edit > Copy Figure" en la ventana de la figura. Una vez copiada, la
% figura se puede pegar en un documento de Word o Drive (u otros). Deberá hacer esto con
% todas las figuras solicitadas en los Ejercicios 1 y 2, para crear el .pdf que se pide
% en la guía. Copiar la figura como se indica es mucho mejor que hacer una captura de
% pantalla.

% Note que también es posible guardar las figuras como archivos de imagen (.png, .jpg,
% .eps y otros formatos). Además, se pueden guardar como .fig, que es un formato de figura
% de Matlab. Pruebe guardar la figura como archivo .fig y luego como archivo de imagen.

% Use ahora la función plot3 para graficar la curva definida por xt2, yt2 y zt2, en color
% rojo. Use una nueva figura (figure(4)). En la figura, use el ícono "Rotate 3-D" para
% poder rotar la gráfica. Pruebe usar los otros íconos también.
% Para el reporte, coloque la gráfica en una posición que permita ver claramente la curva
% paramétrica. Copie y pegue la figura en su documento de Word/Drive.
%% ---------------------------------------------------------------------------------------


% Gráficas polares
figure(5); clf;
polarplot(t, r1);
% Grafique ahora r2, r3, y r4.


% Ejecute las siguientes líneas una por una, y vea qué pasa.
figure(6); clf;
surf(X, Y, Z);
xlabel('x'); ylabel('y'); zlabel('z');
colorbar
colormap winter
colormap summer
colormap cool
colormap hot
colormap gray
colormap default

% Use la función mesh en vez de la función surf arriba.

% Ahora use la función contour en vez de la función surf. Note que ya no tiene sentido
% usar zlabel. 

% Ahora use la función surfc en vez de la función surf. Pruebe también la función meshc

% Si quiere cerrar todas las figuras al mismo tiempo, ejecute:
close all;


%% Gráficas (2)
% No se necesita tener variables (vectores) numéricas definidas para graficar.
% Compare lo siguiente con lo hecho en la sección Gráficas (1)

syms x  % no es necesario volver a definir la variable, si ya se había hecho antes

% Ejecute las siguientes líneas una por una, y vea qué pasa. En el "help" puede ver más
% opciones para las funciones.

% Forma y = f(x).
figure(1); clf;
fplot(sin(x));  % intervalo de definición por defecto.
fplot(sin(x), [0, 2*pi]); % intervalo específico

% No es necesario definir una variable simbólica antes:
clear x; % Esto no es necesario. Es para enfatizar que no se necesita tener la variable.
fplot(@(x) exp(x), [-3 0], 'b');  % el @(x) especifica que x es simbólica
hold on
fplot(@(t) cos(t), [0 3], 'r');   % se pudo usar x nuevamente
hold off
grid on


% Paramétricas
figure(2); clf;
xt = @(t) cos(4*t);
yt = @(t) exp(-0.5*t).*t; % Note el uso del operador '.' (operación elemento por elemento)
fplot(xt, yt)

figure(3); clf;
xt = @(t) 2*sin(2*t);
yt = @(t) 8*cos(2*t);
zt = @(t) t;
fplot3(xt, yt, zt, 'Linewidth', 2);    % Note cómo se puede cambiar el ancho de las curvas


% Funciones implícitas: f(x,y) = 0
figure(4); clf;
fimplicit(@(x,y) x.^2 - y.^2 - 1)

% También se pueden definir las variables simbólicas y las ecuaciones, como antes:
syms x y
fimplicit(x^2 + y^2 - 1, 'r');  % De esta forma, no es necesario usar el '.'

ec = x^2 + x*y + y^2 == 1;
fimplicit(ec, 'g');

% Las tres en una misma figura, con distintos marcadores y colores
figure(5); clf;
fimplicit(x^2 - y^2 - 1, 'b:', [-3 3 -3 3]); % intervalos en x y en y de -3 a 3
hold on;
fimplicit(x^2 + y^2 - 1, 'r--');
fimplicit(ec, 'g');
grid on;
xlabel('eje x');
ylabel('eje y');
title('Usando fimplicit');


% Superficies y contornos
% En el help puede ver los siguientes ejemplos y más...
figure(6); clf;
fsurf(@(x, y) sin(x)+cos(y))     % z = f(x,y)

figure(7); clf;
fmesh(@(x,y) y.*sin(x)-x.*cos(y), [-2*pi 2*pi])
title('ysin(x) - xcos(y) for x and y in [-2\pi,2\pi]')
xlabel('x');
ylabel('y');
zlabel('z');
box on      % box off, para quitar el marco

figure(8); clf;
f8 = @(x,y) x.^2 - y.^2;
fcontour(f8, 'LineWidth', 2)

figure(9); clf;
f9 = @(x,y,z) x.^2 + y.^2 - z.^2;    % f(x,y,z) = 0
fimplicit3(f9)

%% Ejercicio 2 -------------------------------------------
% Grafique el plano definido en el archivo PS_Lab2_1.m (líneas 42-47) en la misma figura
% en que se graficó la función implícita f9 arriba (deben aparecer las dos superficies).
% El plano debe graficarse sin líneas negras (superficie lisa). 
% Ayuda: en el help de fimplicit3, busque una sección en que se muestra cómo 
% modificar la apariencia de las superficies. En particular, busque la propiedad 
% 'EdgeColor', y cómo se pueden quitar las líneas con el valor 'none' de dicha propiedad.
% Agregue los siguientes elementos: 
% - Nombre a los ejes
% - Título a la figura.
% Copie la figura a su documento de Word/Drive.
%% ---------------------------------------------------------------------------------------
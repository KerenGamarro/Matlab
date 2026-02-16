%% Procesamiento de Señales - Laboratorio 3, Primera Parte
%  Pedro Joaquín Castillo, Julio Andrés Ávila
%  Operadores relacionales y lógicos, estructuras de control de programación

clear       % elimina las variables del Workspace
clc         % limpia la ventana de comandos

% Puede revisar las distintas estructuras de control y los operadores relacionales y
% lógicos en el help. Busque "MATLAB Operators and Special Characters".
% Operadores relacionales: ==, ~=, >, <, >=, <=
% Operadores lógicos: &, |, ~, &&, ||
% Estructuras de control: if, elseif, else, while, for, switch, case

%% Operadores relacionales y lógicos
v1 = [1 1 2 1 2 3 1 2 3 4];
v2 = 0:5;
v3 = -3:2;
v4 = [1 0 2 -1 0.5 3 7 2 0 4];

% Corra las siguientes líneas una por una, y vea cómo funcionan los operadores y qué
% devuelven.
v1 == 1         % Se devuelve vector lógico, con unos en las posiciones en que la
a = v2 == 2     % condición se cumple. Observe el "value" en el Workspace.
b = v1 == v4    % Se compara elemento por elemento. Las dimensiones del vector o matriz
v1 == v2        % deben coincidir entre variables.
v1 ~= 3
c = v3 ~= 0
v2 ~= v3
v1 > 2
d = v2 < 3.5
v1 > v4
ind = v1 >= 2
v3 <= -3
e = v2 <= v3

% Se puede usar lo anterior para hacer un "indexado lógico". Observe bien los resultados
% siguientes. Se devuelven los elementos de los vectores para los que se tiene un 1
% en el vector de argumento (índices lógicos).
ind_log1 = v1(ind)
ind_log2 = v4(v4>1)

1 & 0       % Operador AND. El resultado es lógico (1 o 0).
2 & 0       % Cualquier número distinto de 0 se toma como 1.
1 & 3
v1 & v4     % AND elemento por elemento. Las dimensiones de los operandos deben coincidir.
0 | 0       % Operador OR. El resultado es lógico (1 o 0).
1 | 0
5 | 3       % Cualquier número distinto de 0 se toma como 1
v3 | v2     % OR elemento por elemento. Las dimensiones de los operandos deben coincidir.
~v2         % Operador NOT. Elemento por elemento. Cualquier número distinto de 0 se toma
~v4         % como 1.

% && y || sólo sirven con operandos escalares, no vectores. Junto con otros operadores,
% son útiles para evaluar condiciones al usar if, elseif, while y algunas otras, como
% verán a continuación.


%% if, elseif, else
% Corra las instrucciones de esta sección (tomadas del help de Matlab). Luego,
% modifique el valor de x, y vuelva a correr las instrucciones. Ejecute la sección entera,
% no línea por línea.

x = -8;     % pruebe distintos valores
minVal = 2;
maxVal = 6;

if ((x >= minVal) && (x <= maxVal))
    disp('Value within specified range.')  % Despliega un string en la ventana de comandos
elseif (x > maxVal)
    disp('Value exceeds maximum value.')
else
    disp('Value is below minimum value.')
end


%% while, break
% Ahora corra las siguientes instrucciones, que ilustran el uso de while (y algunas otras
% funciones). Ejecute la sección entera, no línea por línea.

valor_cond = -1;
while((valor_cond < 0) || (valor_cond > 10))
    valor_cond = randi([-10,20], 1); % randi da enteros aleatorio. Vea su uso en el help.
    if valor_cond == 15     % Se pueden poner paréntesis, aunque no son necesarios
        disp('Condición especial. Forzamos la salida del ciclo con break');
        break
    end
    fprintf('valor_cond: %d\n', valor_cond); % Similar al printf del lenguaje C
    pause(0.5); % 'pause' suspende la ejecución cierto tiempo (en segundos). 0.5s en este caso.
end


%% for
% Ejemplo tomado del help de Matlab
% Se calculan ciertos valores y se guardan en una matriz
N = 10;
M = 15;
H = zeros(N, M);
for m = 1:M
    for n = 1:N
        H(n, m) = 1/(n+m-1); % Aquí se haría lo que se necesite con/para el elemento (n,m)
    end
end


%% Buena práctica: siempre que sea posible, defina las matrices (vectores, estructuras)
% que va a utilizar antes de ejecutar los ciclos. De esa forma, se reserva la memoria
% necesaria por anticipado. Por ejemplo, se pueden usar funciones como zeros, ones, etc.
% Si no se predefinen las variables, el código también funcionará, pero será ineficiente 
% computacionalmente hablando. Eso es porque en cada iteración se deberá reservar memoria,
% al ir creciendo las variables. Reservar memoria es "tardado", especialmente al agregarla
% a variables que ya existen, por lo que se prefiere reservar la memoria entera que se
% necesitará para las variables.
% Para verificar lo anterior, corra el código del Ejercicio 1 a continuación, el cual
% tiene unas pequeñas modificaciones respecto al código de la sección previa. Note las
% funciones tic y toc, las cuales permiten iniciar y detener un timer para medir el tiempo
% de ejecución (puede consultar dichas funciones en el help).

%% --- Ejercicio 1 ------------------------------------------------------------------------
% Corra la sección 5 veces y calcule el promedio de los tiempos desplegados. Note que la
% instrucción para definir la matriz H está comentada. Por lo tanto, H se creará en la
% primera iteración e irá creciendo en cada iteración siguiente.

% Después, descomente la línea H = zeros(N, M); y corra la sección 5 veces más. Calcule el
% promedio de los tiempos desplegados. Si la diferencia de los tiempos promedio no es
% significativa con y sin la pre-definición de H, pruebe aumentar las dimensiones de la
% matriz (N y M).

% En el script que subirá a Canvas: Escriba los tiempos individuales y el tiempo promedio,
% para cada caso (con y sin predefinición).

clear H  % en caso existiera la variable
N = 10000;
M = 15000;
H = zeros(N, M);
tic
for m = 1:M
    for n = 1:N
        H(n,m) = 1/(n+m-1);
    end
end
toc
% ----------------------------------------------------------------------------------------

%% switch, case, otherwise
% Lea sobre estas directivas en el help.

%% Procesamiento de Señales - Laboratorio 1, Cuarta Parte
%  Pedro Joaquín Castillo, Julio Andrés Ávila
%  Conceptos Básicos (2): Vectores y matrices, usando el "help"

clc     % limpia la ventana de comandos

%% Vectores, matrices (1)
% Vectores y matrices se definen usando []. Elementos separados por espacio en blanco
% o por ',' estarán en columnas distintas, es decir, en la misma fila. Elementos separados
% por ';' estarán en filas distintas, es decir, en la misma columna. 
% No es requisito usar minúsculas para vectores y mayúsculas para matrices. Aquí se hace
% de esa forma por conveniencia (y costumbre...).
a = [1 2 3];  b = [4,5,6];  c = [-1;2.5];  % Se puede o no dejar espacios en blanco después
A = [5 4 -1;3 2 7;-1 2 8];                 % de las comas y/o puntos y coma.
B = 0.1*[4 5 4;-2 2 -1];

% Prueben las siguientes líneas. ¿Son válidas todas las operaciones siguientes? Noten que
% hay algunos errores (a propósito).
a
-a
a'      % Se usa ' para trasponer matrices
b
c

2*b     
c+1     % notar que el '1' se suma a cada elemento de c (no haría sentido de otra forma)
d = a+b

a*b     % multiplicación matricial (tengan en cuenta las reglas para multiplicar matrices)
a.*b    % Se usa el '.' para indicar multiplicación (operación) elemento por elemento
b./a
a.^2    % ¿Por qué se necesita el operador '.'? ¿Qué pasa si se hace a^2, con a vector?
a*b'
dot(a, b) % Producto punto. Comparen con la línea anterior
v = cross(a, b)  % Producto cruz
a*v'
dot(b, v) % Notar que no es necesario el espacio después de la coma. Se pudo llamar así:
          % dot(b,v). Dejar los espacios después de las comas que separan a los
          % argumentos puede ayudar a que se lea mejor o que se vea más ordenado el código.
C = a'*b

A
A'          % traspuesta
B
B'
D = A*A;    % multiplicación matricial
E = A.*A;   % multiplicación elemento por elemento
F = A+D     % La suma matricial ya es elemento por elemento, por lo que no se necesita el '.'
a*A
A'*b'
B*c
c*B

% Funciones como las siguientes, aplicadas a vectores y matrices, devuelven
% vectores y matrices. Las operaciones se aplican a cada elemento (sin necesidad de
% usar el operador '.').
sqrt(b)
exp(c)
sin(A)
log10(abs(B))

%% --- Introducción al "help" de Matlab ---------
% El "help" de Matlab es muy útil para aprender a usar funciones y toolboxes, así como
% para buscar funciones que nos podrían ser útiles, pero que no sabemos sus nombres.
% Podemos acceder al "help" con el botón (?) que aparece en la pestaña "HOME" o en la
% parte superior derecha.
% Abran el "help" y busquen la función "norm" que usaremos abajo.

% También podemos ver un resumen de las funciones llamando al help (resumen) desde la
% ventana de comandos. Por ejemplo:
%    help norm
%% ----------------------------------------------

norm([5 12])     % Por defecto, la norma Euclidiana (2-norma)
norm(a)
norm(b)
norm(c)
norm(a-b)   % Se calcula la norma del vector resultante de la resta entre a y b
norm(b, 1)  % 1-norma. (en Matemática, hay muchas formas de definir normas)
norm(b, 2)  % 2-norma. Equivalente a norm(b)
norm(b, 3)  % 3-norma.

% Pueden usar el "help" para investigar las funciones siguientes.
det(A)
A_inv = inv(A)
det(D)
D_inv = inv(D)
trace(A)
rank(A)
[eigVectores, eigValores] = eig(A);
eigVectores
eigValores

n = length(a)
[fil_A, col_A] = size(A);
fil_A
col_A

% Noten la diferencia al incluir un argumento adicional al llamar a la función size:
fil_B = size(B, 1) % El 1 implica filas.
col_B = size(B, 2) % El 2 implica columnas.

% Prueben determinar el número de elementos de los vectores b y c usando tanto la
% función "length" como la función "size".

%% Ejemplo:
% Resolver un sistema de ecuaciones lineales, expresado en términos de matrices y vectores
% 5x + 4y -  z = 19
% 3x + 2y + 7z = -5
% -x + 2y + 8z = -11

% Se puede expresar así: Ax = b
% y la solución está dada por: x = A^(-1)*b
A = [ 5 4 -1; ...   % se usa '...' para continuar en la siguiente línea. No es necesario,
      3 2  7; ...   % pero ayuda a ordenar el código y evitar que haya líneas muy largas.
     -1 2  8]
b = [19; -5; -11]

x1 = inv(A)*b
x2 = A\b    % A\ es equivalente a usar inv(A), pero es computacionalmente más eficiente.


%% Vectores, matrices (2)
% Algunas formas/funciones para definir vectores y matrices de forma fácil
% Pueden investigar las funciones en el "help"
% Si quieren desplegar los resultados, recuerden quitar el ';' o escribir la variable en
% la ventana de comandos después de definirla.

v1 = 1:10;     % vector fila con enteros entre 1 y 10
v2 = 0:2:20;   % vector fila con elementos desde 0 hasta 20, incrementando en 2

% Podemos usar variables para definir vectores o matrices:
val_ini = 1.5; val_incr = 0.01; val_fin = 2.5;
v3 = val_ini:val_incr:val_fin;  % vector fila con elementos desde val_ini hasta val_fin,
                                % incrementando en val_incr.

v4 = linspace(-1,1,5);  % vector con 5 elementos igualmente espaciados, entre -1 y 1
v5 = zeros(1,10);       % vector fila con 10 ceros (1 fila, 10 columnas)
v6 = ones(20,1);        % vector columna con 20 unos (20 filas, 1 columna)
M1 = zeros(15,4);       % matriz de 15x4 llena de ceros
M2 = ones(size(M1));    % matriz llena de unos, de las mismas dimensiones que M1
M3 = eye(5);            % matriz identidad de 5x5
M4 = rand(4,3); % matriz de 4x3 con elem. aleatoriamente seleccionados del intervalo (0,1)

v7 = 1:5;
v8 = 6:10;

% La siguiente es una matriz cuya primera fila es igual a v7, la segunda fila es igual a
% v8, y la última fila tiene valores 2.5. Para definir matrices así, debe haber
% consistencia en las dimensiones de los elementos.
M5 = [v7; v8; 2.5*ones(1,5)];

v9 = randperm(10);      % vector fila con permutación aleatoria de los valores de 1 a 10
v10 = randperm(100,5);  % vector fila con 5 valores distintos y aleatorios entre 1 y 100

% Los elementos de matrices/vectores están indexados de la siguiente forma:
% [(1,1) (1,2), ..., (1,m)
%  (2,1) (2,2), ..., (2,m)
%  ...
%  (n,1) (n,2), ..., (n,m)]
% Es decir, el primer elemento siempre tiene el índice (1,1) o (1) para vectores, no (0,0)
% o (0) para vectores, como en los lenguajes C/C++ y otros.

% Para acceder a elementos de matrices y vectores, use (). Pueden acceder a elementos
% individuales, varios elementos al mismo tiempo, filas o columnas enteras, etc.
% Investiguen los siguientes ejemplos; prueben otros. 
v1(1)
v2(4)
v3(length(v3))  % último elemento del vector v3
v3(end)  % compare con la línea anterior. 'end' también está predefinida
v4(1:3)  % accede a los elementos 1, 2 y 3 del vector v4

v5
v5(2) = 7; v5(9) = -2.5;    % Se pueden modificar elementos individualmente
v5
v5([2,5,9])  % accede a los elementos 2, 5 y 9 del vector v5
% prueben acceder a los elementos del 1 al 3 y del 7 al último de v2

M1(1,1)
M2(7,3)  % el primer valor es el de la fila, el segundo el de la columna
M4
M4(1,:)  % el ':' indica "todos". En este caso, se accede a toda la fila 1 (todas las cols.)
M4(:,2)  % se accede a toda la columna 2 (todas las filas)
v11 = M3(2,:)   % ¿Qué se obtiene aquí?
M5
M6 = M5([1,3], [2,4,5])  % Sub-matriz de M5

v2
ind_vec = [1,3,7,9];
v2(ind_vec) % Despliega los elementos 1, 3, 7 y 9 del vector v2
% Noten que se pueden usar vectores con números enteros positivos como índices de otros
% vectores o matrices, como el vector ind_vec arriba.


% Noten que si pasan el mouse sobre las variables, se muestra el contenido de las mismas,
% siempre y cuando ya existan en el Workspace.

% También pueden visualizar y editar las variables en un editor tipo hoja de excel. Hagan
% doble clic a una de las variables en el Workspace (ej. M1). Noten que aparece una
% ventana adicional en el espacio de edición. Si abren más variables, aparecerán más
% pestañas en el editor de variables.
% Prueben cambiar uno o varios de los elementos de la variable que abrió. Luego,
% despliéguenla en la ventana de comandos, para verificar los cambios que hicieron.

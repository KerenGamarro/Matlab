%% Procesamiento de Señales - Laboratorio 2, Primera Parte
%  Pedro Joaquín Castillo, Julio Andrés Ávila
%  Conceptos Básicos (3): Variables, ecuaciones y funciones simbólicas

clear   % elimina las variables del Workspace
clc     % limpia la ventana de comandos

%% 
% Evalúe las instrucciones siguientes poco a poco. No corra todo el script de una vez.

% Para más detalles, recuerde consultar el help
syms x y a b c          % syms define variables simbólicas
ec1 = 2*x + 3 == 5;     % Dado que x es simbólica, ec1 también (lo hereda de x).
ec2 = 3*y^2 - 4*y + 1 == 0;
ec3 = a*x + b*y - 2*c;  % El igual a cero (== 0) está implícito.
% Note el "Value" de las variables en el Workspace

% Resolver ecuaciones. No es necesario asignar la solución a una variable.
solve(ec1, x)            % resuelve para x
sol1 = solve(ec1, x)     % resuelve para x, asigna el resultado a otra variable
sol2 = solve(ec2, y)     % resuelve para y, asigna el resultado a otra variable
sol3_1 = solve(ec3, a)   % resuelve para a, asigna el resultado a otra variable
sol3_2 = solve(ec3, b)   % resuelve para b, asigna el resultado a otra variable

% Note que las soluciones también son tipo sym. Se pueden convertir a números o variables
% numéricas:
double(sol1)    % convierte a doble precisión
sol2_num = double(sol2);
sol2_num(1)     % accede a la primera solución
sol2_num(2)     % accede a la segunda solución (de haber)

vpa(sol2)       % vpa: aritmética de precisión variable
vpa(sol2, 6)
vpa(pi)
vpa(pi, 10)

% Podemos evaluar expresiones creadas usando eval
a = 1; b = 2; c = 3;
eval(ec3)       % revise cómo se definió ec3 arriba

% Podemos crear vectores (y matrices) de variables simbólicas:
syms x1 x2 x3    % Pudimos haber usado x, y, z, o cualquier otro nombre válido
vec_sim = [x1; x2; x3];

% Ejemplo: ecuación de un plano. Recordatorio: ec. de un plano: ax + by + cz + d = 0
v_norm = [0; 0; 1];  % vector (columna) normal del plano
plano = v_norm'*vec_sim == 4  % Note que en lugar de x, y, z se usó x1, x2, x3. No importa.

% Sistemas de ecuaciones
ecs = [ 2*x1 +   x2 - 3*x3 == -4,...
       -5*x1 + 2*x2 +   x3 ==  2.5,...
        9*x1 - 3*x2 -   x3];    % en la última, está implícito el == 0

sols = solve(ecs, [x1 x2 x3]);   % Se pudo omitir el segundo argumento con las variables
% la variable sols es una estructura. Los miembros de variables tipo estructuras se
% acceden con el operador '.', así: 
sols.x1
sols.x2
sols.x3
% Si se quieren variables numéricas, no simbólicas:
double(sols.x1)     % se pudo asignar a otra variable: sol_x1 = double(sols.x1)
double(sols.x2)
double(sols.x3)

% Funciones simbólicas
syms f(t) g(u,v)
f(t) = -5*t^2 + 2*t + 3;
g(u, v) = u + sin(v);

% Evaluando las funciones simbólicas
f(1)         % Note el tipo de la variable ans (el "Value", en el Workspace). También es
g(5, pi/2)   % simbólica, aunque el símbolo sea un número.

double(f(1)) % Note ahora el tipo de la variable ans.
g_evaluada = double(g(5, pi/2))  % Note el tipo de la variable

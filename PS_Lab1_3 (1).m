%% Procesamiento de Señales - Laboratorio 1, Tercera Parte
%  Pedro Joaquín Castillo, Julio Andrés Ávila
%  Conceptos Básicos (1): Calculadora, Variables, Números Complejos, save y load

% Noten que los comentarios (como esta línea) se definen con '%'.
% Al usar doble %, se definen secciones.

%% Calculadora
% Prueben los siguientes ejemplos en la ventana de comandos. Realicen otros cálculos.
% No es necesario volver a escribir las operaciones en la ventana de comandos. Pueden
% copiar y pegarlas. Todavía mejor, pueden seleccionar (resaltar) la(s) operación(es) que
% desean ejecutar, y luego presionar F9 (en Windows) o Shift+F7 (en macOS) para evaluar lo
% seleccionado (o dar clic derecho y buscar la opción de evaluar).
2+3*8-15/5
2^2 - 16^(0.5) + (7-3)*((6+2)^(1/3))  % los espacios en blanco ayudan a ordenar el código
2+1i - (7-3i)*(-5+2.5i) + 2i/(2+3i)   % noten que 'i' ya está predefinida (también 'j')
exp(1) + sin(pi/6) - sqrt(25) + cosh(0.5)*log(exp(2)) + factorial(3) % 'pi' también está predefinida
abs(-6) + log10(1e4)    % Atención con la notación: 1e4 = 1*10^4


%% Variables
% Prueben las siguientes líneas. Noten que no se necesita definir el tipo de variables (en
% otros lenguajes es necesario definir si las variables son de tipo entero, punto
% flotante, lógico, arreglos, cadenas, etc.)
% Observen las variables en el "Workspace"
% Matlab distingue entre mayúsculas y minúsculas.
% Noten la diferencia entre incluir el ';' o no incluirlo al final.
% Noten que Matlab da sugerencias/advertencias si detecta algo ineficiente o potencialmente
% no deseado, como desplegar información innecesaria en la ventana de comandos.
x = 50
y = 10;
res = x+y; % Se calcula, pero no se despliega el resultado. Noten la variable en el "Workspace"
w = x*y/res
u1 = cos(res*pi/180)        % Comparen esta y las siguientes dos líneas.
u2 = cos(deg2rad(res))      % En muchos casos, hay varias formas de hacer lo mismo.
u3 = cosd(res)              

% Si el resultado no se asigna a ninguna variable de forma explícita, se asigna por
% defecto a la variable 'ans'. Prueben la siguiente línea y busquen la variable ans en el
% "Workspace".
2*x - 3*y;


%% Números complejos
% Prueben los cálculos siguientes.
% Recuerden que tanto 'i' como 'j' ya están predefinidas como números imaginarios. Esos
% nombres de variables se pueden redefinir, por ejemplo, haciendo i = 2, j = x, etc.
% Tengan cuidado con redefinir variables o funciones preexistentes (en general, evítenlo).
z1 = 3 + 4i;  z2 = 2*exp(1j*pi/3);  % Noten que pueden haber varias instrucciones en una línea.
real(z1)
imag(z1)
abs(z1) %magnitud del vector en polar
angle(z1)           % ¿En qué está dado el ángulo?
angle(z1)*180/pi    % ¿Qué se hizo?
rad2deg(angle(z1))  % Así como existe deg2rad, existe rad2deg. Hay muchas funciones para
                    % hacer conversiones como estas.
conj(z1)

% Hagan con z2 lo mismo que se hizo con z1
% Luego, prueben realizar operaciones entre z1 y z2 (suma, resta, multiplicación, etc.)


%% Guardar y recuperar variables
% Las variables del Workspace se pierden al cerrar Matlab, o al usar la instrucción clear.
% Muchas veces es útil/necesario guardar variables que se han obtenido luego de cálculos
% o procesamiento de datos (especialmente si eso tomó mucho tiempo, y si se usarán más
% adelante). Las variables se pueden guardar en un archivo especial (.mat) que queda en el
% sistema de archivos.
% Para guardar el Workspace completo en un archivo .mat: Pueden hacerlo con el ícono
% "Save Workspace" en la pestaña "HOME" del menú superior. También pueden usar el comando
% save, como se muestra a continuación:

% Las siguientes formas de llamar a la función save y load son equivalentes
save MisVars1.mat       % Noten el archivo creado en el espacio "Current Folder".
save('MisVars1.mat')    % Prueben con otro nombre (SIN espacios en blanco).

clear  % Este comando elimina las variables del Workspace.

% Si quieren recuperar las variables guardadas, pueden darle doble clic en el archivo,
% pueden usar el ícono "Import Data" (en la pestaña "HOME"), o pueden usar el comando load:
load MisVars1.mat
load('MisVars1.mat')    % Equivalente

% No siempre es necesario guardar todas las variables del Workspace. Pueden guardar
% variables individuales o subconjuntos del Workspace:
save MisVars2.mat var1 var2 var3 var4   % las variables deben existir en el Workspace
save('MisVars2.mat', 'var1', 'var2', 'var3', 'var4')    % Equivalente

% Prueben guardar algunas de las variables creadas en las secciones anteriores (x, z1, etc.)

% También pueden recuperar variables individuales o subconjuntos de lo guardado. Usen
% "Import Data" y seleccionen las variables deseadas, o usen:
load MisVars2.mat var1 var2     % las variables deben existir en el archivo
load('MisVars2.mat', 'var1', 'var2')    % Equivalente

% Limpien el "Workspace", y prueben recuperar algunas de las variables guardadas en los
% archivos .mat que crearon.

% Es posible guardar archivos .mat en folders que no sean el "Current Folder". Para ello,
% se debe especificar la ruta deseada. De igual forma, se pueden abrir los archivos .mat
% que no estén en el "Current Folder".
save('C:\Ruta\al\folder\donde\quedará\el\archivo\MisVars3.mat');  % La ruta debe ser válida
load('C:\Ruta\al\folder\donde\está\el\archivo\MisVars3.mat');  % La ruta debe ser válida

% Prueben lo anterior, en alguna ruta válida en la computadora en la que estén trabajando.

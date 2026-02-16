% =========================================================================
% GENERACIÓN DE SINUSOIDES COMPLEJOS PERIÓDICOS EN EL INTERVALO [0, N-1]
% =========================================================================
% Este script permite visualizar todos los sinusoides complejos periódicos
% únicos que existen en el intervalo [0, N-1]. Recordemos que dado que los
% sinusoides son complejos tienen tanto parte real como imaginaria por lo
% que se grafican ambas partes en gráficos separados.

% Se establece el intervalo de tiempo discreto.
N = 8;
n = 0:N-1;

figure(1); clf;
tiledlayout(N, 2, 'TileSpacing', 'tight');

% Se generan los N sinusoides periódicos únicos y se grafican sus partes
% reales e imaginarias.
for k = 0:N-1
    x = exp(1i * (2*pi/N) * k * n);
    nexttile(2*k+1);
    stem(n, real(x), 'b', 'fill', 'LineWidth', 2);
    hold on;
    str = sprintf('k = %d', k);
    ylabel(str, 'fontsize', 12);
    axis([0, N-1, -1, 1]);
    
    nexttile(2*k+2);
    stem(n, imag(x), 'r', 'fill', 'LineWidth', 2);
    hold off;
    axis([0, N-1, -1, 1]);
end

nexttile(1);
title('${\rm Re}(e^{j \frac{2\pi}{N}kn})=\cos(\frac{2\pi}{N}kn)$', ...
    'interpreter', 'latex', 'fontsize', 16);

nexttile(2);
title('${\rm Im}(e^{j \frac{2\pi}{N}kn})=\sin(\frac{2\pi}{N}kn)$', ...
    'interpreter', 'latex', 'fontsize', 16);

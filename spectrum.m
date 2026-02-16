% =========================================================================
% IE3032/BE3022 - Análisis de Fourier (discreto)
% -------------------------------------------------------------------------
% Se calcula y visualiza la DFT de una señal discreta x[n] dada.
% =========================================================================
function spectrum(x, plotopt)
    % Se obtiene el tamaño/intervalo de definición de la señal discreta
    N = length(x);
    n = 0:N-1;
    
    % Se visualiza un stemplot de la señal discreta
    figure;
    subplot(2,2,1);
    if(strcmp(plotopt, 'stem'))
        stem(n, x, 'filled', 'k');
    else
        plot(n, x, 'k', 'LineWidth', 1);
    end
    xlabel('$n$', 'FontSize', 16, 'interpreter', 'latex');
    ylabel('$x[n]$', 'FontSize', 16, 'interpreter', 'latex');
    grid minor;
    
    X = fft(x, N);
    k = 0:round(N/2)-1;  % Sólo la primera mitad
    dw = 2*pi/N; % Frecuencias armónicas
    w = k*dw/pi; % Ticks de frecuencia normalizada (x pi rad/muestra)
    
    subplot(2,2,2);
    if(strcmp(plotopt, 'stem'))
        stem(w, abs(X(1:length(k))), 'filled', 'k');
    else
        plot(w, abs(X(1:length(k))), 'k', 'LineWidth', 1);
    end
    grid minor;
    ylabel('$\left|X[k]\right|$', 'FontSize', 14, 'interpreter', 'latex');
    xlabel('$\omega \ (\times \pi \ \mathrm{ rad/}\mathrm{muestra})$', 'FontSize', 14, 'interpreter', 'latex');
    
    subplot(2,2,4);
    if(strcmp(plotopt, 'stem'))
        stem(w, angle(X(1:length(k))), 'filled', 'k');
    else
        plot(w, angle(X(1:length(k))), 'k', 'LineWidth', 1);
    end    
    grid minor;
    ylabel('$\angle X[k]$', 'FontSize', 14, 'interpreter', 'latex');
    xlabel('$\omega \ (\times \pi \ \mathrm{ rad/}\mathrm{muestra})$', 'FontSize', 14, 'interpreter', 'latex');
end
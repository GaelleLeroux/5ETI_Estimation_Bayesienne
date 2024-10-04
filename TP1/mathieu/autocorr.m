function autocorr(x)
    % Calcul manuel de l'auto-corrélation normalisée
    N = length(x);
    mu = mean(x);
    gamma = xcorr(x - mu, 'biased');
    gamma = gamma(N:end) / gamma(N);  % Normalisation

end
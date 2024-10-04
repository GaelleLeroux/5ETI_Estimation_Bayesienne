T = 10000;
a = 0.5;
b = 0.5;
sigma_q = 0.9;

[samples, accept_rate] = Metropolis_Hasting(T, a, b, sigma_q);

[count, centers] = hist(samples, 50);  % Histogramme avec 50 bins
count = count / (sum(count) * (centers(2) - centers(1)));  % Normalisation

figure;
subplot(2,2,3);
bar(centers, count);
hold on;
x = linspace(0, 1, 1000);
y = Beta(x, a, b);
plot(x, y, 'r', 'LineWidth', 2);
title('Densité de probabilité estimée vs théorique');
legend('Densité estimée', 'Densité théorique');
hold off;

subplot(2,2,4);
plot(xcorr(samples))
title('Autocorrelation densité de probabilité estimée');

subplot(2,1,1);
plot(samples)
title('Autocorrelation densité de probabilité estimée');
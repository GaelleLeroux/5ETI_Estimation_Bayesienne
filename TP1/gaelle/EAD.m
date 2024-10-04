clear variables;
close all;

taille = 101;
x = linspace(0, 1, taille);
f = zeros(1,taille);
a = 0.5;
b = 0.5;
saut = 0.1;
for i=1:taille
    f(i)= Densite_prob_beta(x(i),a,b);
end

% Normalisation min-max
min_val = min(f);
max_val = max(f);

for i=1:taille
    f(i)= (f(i) - min_val) / (max_val - min_val);
end

x_theta = linspace(0, 1, 10001);
[theta,alpha,auto_correlation] = Metropolis_Hastings(10000,a,b,saut);
dimensions = size(x);
disp(['La taille de la liste x est : ', num2str(dimensions(1)), ' x ', num2str(dimensions(2))]);
dimensions = size(f);
disp(['La taille de la liste f est : ', num2str(dimensions(1)), ' x ', num2str(dimensions(2))]);
dimensions = size(theta);
disp(['La taille de la liste theta est : ', num2str(dimensions(1)), ' x ', num2str(dimensions(2))]);
dimensions = size(x_theta);
disp(['La taille de la liste x_theta est : ', num2str(dimensions(1)), ' x ', num2str(dimensions(2))]);

figure('Name','Densité de probabilite')
subplot(2, 1, 1);  
plot(x_theta,theta);
xlabel('theta');

subplot(2, 2, 3);
hold on;

% Calcul de l'histogramme manuellement avec 'histcounts'
[counts, edges] = histcounts(theta, 'Normalization', 'probability');

% Normalisation pour que le maximum soit à 1
counts = counts / max(counts);

% Affichage de l'histogramme avec bar
bar(edges(1:end-1), counts, 'histc');
plot(x,f);
hold off 

subplot(2, 2, 4);
plot(auto_correlation)
 

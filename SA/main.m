clear all; close all;

N=500; % Numero de satelites
M=40; % Número de representantes
rand('seed',50);
space = randi(N,N,2); % coordenadas de los satélites en el espacio

[X,C,i]=simulatedAnnealing(N,M,space)

plot(space(:,1),space(:,2),'.'); hold on;
plot(space(X,1),space(X,2),'*')
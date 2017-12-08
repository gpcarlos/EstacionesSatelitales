clear all; close all;

N=500; % Numero de satelites
M=40; % Número de representantes
rand('seed',5);

coordenadas = randi(N,N,2); % coordenadas de los satélites en el espacio
T=1000;
T_limite=0.01;
tic
[X,C,i] = simulatedAnnealing(N,M,coordenadas,T,T_limite)
toc

plot(coordenadas(:,1),coordenadas(:,2),'.'); hold on;
plot(coordenadas(X,1),coordenadas(X,2),'*');

clear all; close all;

N=500; % Número de satelites
M=40; % Número de representantes
rand('seed',5);

coordinates = randi(N,N,2); % Coordenadas de los satélites en el espacio
T=1000000;
T_limit=0.01;
pcool=0.98;

tic
[X,C] = simulatedAnnealing(N,M,coordinates,T,T_limit,pcool)
time=toc

plot(coordinates(:,1),coordinates(:,2),'.'); hold on;
plot(coordinates(X,1),coordinates(X,2),'*');

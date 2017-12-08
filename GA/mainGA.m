clear all; close all;

N=500; % Número de satélites
M=40; % Número de representantes
rand('seed',5);
coordinates = randi(N,N,2); % Coordenadas de los satélites en el espacio
NPopulation=20;

Pop = generatePopulation(N,M,NPopulation);
FitPop = evaluatePopulation(Pop,coordinates);

tic
[Pop,FitPop] = geneticAlgorithm(Pop, FitPop, N, coordinates);
toc

[~,pos_]=max(FitPop); X=Pop(pos_,:); FitPop(pos_)

plot(coordinates(:,1),coordinates(:,2),'.'); hold on;
plot(coordinates(X,1),coordinates(X,2),'*')

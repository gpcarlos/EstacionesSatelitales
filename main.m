
N=20;%500; % Numero de satelites
M=4;%40; % Número de representantes
% rand('seed',50);
space = randi(N,N,2); % coordenadas de los satélites en el espacio

[X,C,i]=simulatedAnnealing(N,M,space)
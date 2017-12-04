clear all; close all;

N=500; % Numero de satelites
M=40; % Número de representantes
rand('seed',50);
space = randi(N,N,2); % coordenadas de los satélites en el espacio
NPoblacion=6;

Pob=GeneratePopulation(N,M,NPoblacion);
FitPob=-EvaluaPoblacion(Pob,space);

disp('El mejor de la poblacion al inicio es:')
[~,pos_]=max(FitPob); FitPob(pos_)%[Pob(pos_,:) FitPob(pos_)]

[Pob,FitPob]=Genetic(Pob, FitPob, N, space);

disp('El mejor de la poblacion tras las operaciones es:')
[~,pos_]=max(FitPob); FitPob(pos_)%[Pob(pos_,:) FitPob(pos_)]
X=Pob(pos_,:);
plot(space(:,1),space(:,2),'.'); hold on;
plot(space(X,1),space(X,2),'*')
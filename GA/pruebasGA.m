% Los resultados salen diferentes en comparación a hacer las pruebas
% individualmente debido al rand

clear all; close all;

N=500; % Número de satélites
M=40; % Número de representantes
rand('seed',5);
coordinates = randi(N,N,2); % Coordenadas de los satélites en el espacio

MAX_itera=[1000 2000];
NPopulation=[10 20];
Pcross=[0.7 0.8 0.9];
Pmut=[0.1 0.2];
crossover=["OX" "PMX"];
selection=["Tournament" "RouletteWheel"];
replace=["generational" "elitist"];

CBest=inf; Best=[];
itera=1;
for MaxI=MAX_itera
   for  Np=NPopulation
      for pc=Pcross 
         for pm=Pmut
            for cross=crossover
               for sel=selection
                  for rep=replace 
                       Pop = generatePopulation(N,M,Np);
                       FitPop = evaluatePopulation(Pop,coordinates);
                       tic
                       [Pop,FitPop] = geneticAlgorithm(Pop, FitPop, coordinates, MaxI, pc, pm, cross, sel, rep);
                       time=toc;
                       [~,pos_]=max(FitPop); X=Pop(pos_,:); C=-FitPop(pos_)
                       if C<CBest
                           CBest=C;
                           Best=X;
                       end
                       results{itera,1}=MaxI; results{itera,2}=Np;
                       results{itera,3}=pc; results{itera,4}=pm;
                       results{itera,5}=cross; results{itera,6}=sel;
                       results{itera,7}=rep; results{itera,8}=C;
                       results{itera,9}=time; results{itera,10}=itera;
                       itera=itera+1;    
                  end
               end
            end
         end
      end
   end
end

figure;
plot(coordinates(:,1),coordinates(:,2),'.'); hold on;
plot(coordinates(Best,1),coordinates(Best,2),'*'); hold on;
legend('Satélites', 'Representantes')
    
figure;
[~,pos_]=sort([results{:,8}],'descend');
info=[[results{pos_,1}]' [results{pos_,2}]' [results{pos_,3}]' [results{pos_,4}]' [results{pos_,5}]' [results{pos_,6}]' [results{pos_,7}]' [results{pos_,9}]' [results{pos_,8}]'/1.0e+04 [results{pos_,3}]' [results{pos_,4}]' [results{pos_,10}]'];
h=[];
for i=1:size(results,1)
   scatter(info(i,8),info(i,9),'filled'); hold on;
   h=[h string(info(i,12))+' Valor:'+string(info(i,9))+'  MAXItera:'+string(info(i,1))+'  NPop:'+string(info(i,2))+'  Pcros:'+string(info(i,10))+'  Pmut:'+string(info(i,11))+'  Sel:'+string(info(i,6))+'  Cross:'+string(info(i,5))+'  Rep:'+string(info(i,7))]; hold on;
end
grid on

firstandlast=[h(1) h(length(h))];

labels = num2str([results{pos_,10}]','%d');  
text(double(info(:,8)), double(info(:,9)), labels, 'horizontal','left', 'vertical','bottom'); hold on;

legend(firstandlast); ylabel('Valor/1.0e+04'); xlabel('Tiempo en segundos')

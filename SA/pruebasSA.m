% Los resultados salen diferentes en comparación a hacer las pruebas
% individualmente debido al rand

clear all; close all;

N=500; % Número de satelites
M=40; % Número de representantes
rand('seed',5);

coordinates = randi(N,N,2); % Coordenadas de los satélites en el espacio
T=[1000 1000000];
T_limit=[0.1 0.01];
pcool=[0.9 0.98];

CBest=inf; Best=[];
itera=1;
for temp=T
   for templ=T_limit
       for enf=pcool
           tic
           [X,C] = simulatedAnnealing(N,M,coordinates,temp,templ,enf);
           time=toc;
           if C<CBest
               CBest=C;
               Best=X;
           end
           results{itera,1}=temp; results{itera,2}=templ;
           results{itera,3}=enf; results{itera,4}=C;
           results{itera,5}=time; results{itera,6}=itera;
           itera=itera+1;
       end
   end
end

figure;
plot(coordinates(:,1),coordinates(:,2),'.'); hold on;
plot(coordinates(Best,1),coordinates(Best,2),'*'); hold on;
legend('Satélites', 'Representantes')
    
figure;
[~,pos_]=sort([results{:,4}],'descend');
info=[[results{pos_,1}]' [results{pos_,2}]' [results{pos_,3}]' [results{pos_,5}]' [results{pos_,4}]'/1.0e+04 [results{pos_,6}]'];
h=[];
for i=1:size(results,1)
   scatter(info(i,4),info(i,5),'filled'); hold on;
   h=[h string(info(i,6))+' Valor:'+string(info(i,5))+'  Temp:'+string(info(i,1))+'  Tlim:'+string(info(i,2))+'  Enf:'+string(info(i,3))]; hold on;
end
grid on


labels = num2str([results{pos_,6}]','%d');  
text(double(info(:,4)), double(info(:,5)), labels, 'horizontal','left', 'vertical','bottom'); hold on;


legend(h); ylabel('Valor/1.0e+04'); xlabel('Tiempo en segundos')

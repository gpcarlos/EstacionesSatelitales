function [X,C,i]=simulatedAnnealing()
    
    %temp inicial y limite
    T=1000000;
    T_limite=0.1;
    N=500;
    M=40;
    %rand('seed',50);
    space = randi(N,N,2);
    
    actual=randperm(N,M)
    
    mejor=actual;
    i=0;
    
    while(T>T_limite) && Fvalu(actual,space) ~= 0
       m = distARep(actual,space);
       [min_,rep]=min(m');
       minYpos=[min_; rep];
       minYpos=minYpos';
       
       j=1; sumas=[];
       while j~=M+1
           pos=find(minYpos(:,2)==j);
           sumas=[sumas; sum(minYpos(pos(:),1))];
           j=j+1;
       end
       
       [~,posRep]=min(sumas);
       Representante=actual(posRep);
       nuevo = sucesorAleatorio(space,actual,Representante);
       
       deltaE = Fvalu(nuevo,space) - Fvalu(actual,space);
       
       if(deltaE<0) %si la solucion es mejor, se coge directamente
           actual=nuevo;
           mejor=actual;
       else
           p=exp(-deltaE/T);
           if(p>rand(0,1)) %acepta la solucion de forma aleatoria
               actual=nuevo;
               
           end
       end
       T=enfriar(T);
       i=i+1;
    end
    X=mejor;
    C=Fvalu(actual,space);
   
end
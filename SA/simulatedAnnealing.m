function [X,C,i]=simulatedAnnealing(N,M,space)
    
    %temp inicial y limite
    T=1000000;
    T_limite=0.1;
    
    actual=randperm(N,M) % Actual grupo de representantes
    
    mejor=actual;
    i=0;
    
    while (T>T_limite)
       m = distARep(actual,space);
       [min_,rep_]=min(m');
       minYpos=[min_; rep_];
       minYpos=minYpos';
       
       j=1; sumas=[];
       while j~=M+1
           pos=find(minYpos(:,2)==j);
           sumas=[sumas; sum(minYpos(pos(:),1))];
           j=j+1;
       end % Calculamos la suma de todas las distancias mínimas a cada representante
       
       [~,posRep]=min(sumas);
       Representante=actual(posRep);
       % Elegimos el representante con menor distancias
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
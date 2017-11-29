function [X,C,i]=simulatedAnnealing(X_)
    
    %temp inicial y limite
    T=1000;
    T_limite=0.1;
    N=50;
    M=4;
    rand('seed',5);
    space = randi(N,N,2);
    
    actual=randperm(N,M);
    
    mejor=actual;
    i=0;
    
    while(T>T_limite) && fevalu(space,actual) ~= 0
       pos=1;
       
       nuevo = sucesorAleatorio(space,actual,pos);
       
       deltaE = fevalu(space,actual) - fevalu(space,actual);
       
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
    C=fevalu(space,X);
   
end
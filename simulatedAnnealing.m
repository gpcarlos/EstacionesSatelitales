function [X,C,i]=simulatedAnnealing()
    
    %temp inicial y limite
    T=10000;
    T_limite=0.1;
    N=50;
    M=4;
    rand('seed',5);
    space = randi(N,N,2);
    
    actual=randperm(N,M);
    actual = [1 2 3 4];
    
    mejor=actual;
    i=0;
    
    while(T>T_limite) && Fvalu(actual,space) ~= 0
       m = distARep(actual,space);
       m = m';
       
       j=0;
       v=0;
       pos=1;
       while j<=M
            posiciones = find(m(:,2) == j);
            aux=sum(m(posiciones,1));
            if aux>=v
                v=aux;
                pos=j;
            end    
            j=j+1;
       end    
       
       nuevo = sucesorAleatorio(space,actual,pos);
       
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
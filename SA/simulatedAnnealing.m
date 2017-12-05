function [mejor,C,iteraciones,tiempo]=simulatedAnnealing(N,M,space)
    tic
    T=1000000; % Temperatura inicial
    T_limite=0.01; % Temperatura minima

    actual=randperm(N,M) % Representantes iniciales

    mejor=actual; % La mejor es la inicial

    iteraciones=0; % Contador de iteraciones que se producen
    while (T>T_limite)

       RepACambiar=actual(randi(M)); % Elegimos un representante aleatorio
                                     % que cambiaremos

       % Nuevo conjunto de representantes
       nuevo = sucesorAleatorio(space,actual,RepACambiar);

       deltaE = Fvalu(nuevo,space) - Fvalu(actual,space);
       if(deltaE<0) % si la solucion es mejor, se coge directamente
           actual=nuevo;
           mejor=actual;
       else
           p=exp(-deltaE/T);
           if(p>rand(0,1)) %acepta la solucion de forma aleatoria
               actual=nuevo;
           end
       end

       T=enfriar(T);
       iteraciones=iteraciones+1;
    end

    C=Fvalu(actual,space);
    tiempo=toc;
end

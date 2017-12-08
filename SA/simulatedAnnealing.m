function [best,value,itera] = simulatedAnnealing(N,M,coordinates,T,T_limite)
    % T: Temperatura inicial
    % T_limite: Temperatura minima

    current=randperm(N,M) % Representantes iniciales

    best=current; % La mejor es la inicial

    itera=0;
    while (T>T_limite)

       RepToChange=current(randi(M));
       % Elegimos un representante aleatorio a cambiar

       new = random_sucessor(coordinates,current,RepToChange);
       % Nuevo conjunto de representantes aleatorio

       deltaE = Fvalue(new,coordinates) - Fvalue(current,coordinates);
       if(deltaE<0) % Si la solucion es mejor, se coge directamente
           current = new;
           best = current;
       else
           if(exp(-deltaE/T)>rand(0,1)) % Acepta la solucion de forma aleatoria
               current = new;
           end
       end

       T=cool(T);
       itera=itera+1;
    end

    value=Fvalue(current,coordinates);
end

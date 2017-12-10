function [best,value] = simulatedAnnealing(N,M,coordinates,T,T_limit,pcool)
    % T: Temperatura inicial
    % T_limit: Temperatura mínima

    current=randperm(N,M); % Representantes iniciales

    best=current; % La mejor es la inicial

    while (T>T_limit)

       RepToChange=current(randi(M));
       % Elegimos un representante aleatorio a cambiar

       new = random_sucessor(coordinates,current,RepToChange);
       % Nuevo conjunto de representantes aleatorio

       deltaE = Fvalue(new,coordinates) - Fvalue(current,coordinates);
       if(deltaE<0) % Si la solución es mejor, se selecciona
           current = new;
           best = current;
       else
           if(exp(-deltaE/T)>rand(0,1)) % Acepta la solución de forma aleatoria
               current = new;
           end
       end

       T=cool(T,pcool);
    end

    value=Fvalue(current,coordinates);
end

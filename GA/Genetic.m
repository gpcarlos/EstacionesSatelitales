function [Pob,FitPob]=Genetic(Pob, FitPob, N, space)
    MAX_itera=5000;
    Pcross=0.7; % Probabilidades
    Pmut=0.2;
    
    itera=1;
    while itera<=MAX_itera % <Resto de condiciones de parada>
        
        padres=RouletteWheelSelection(FitPob); % devuelve los indices de los padres que se cruzaran
        [parejas,NoParejas]=Emparejar(padres,Pcross,itera);
        if NoParejas
            newPob=Pob;
        else
            newPob=OXcrossover(parejas,Pob); % devuelve nueva poblacion cruzada
        end
        newPobMutada=Muta(newPob,Pmut,N); % poblacion con mutaciones
        FitMutada=-EvaluaPoblacion(newPobMutada,space);
        [Pob,FitPob]=Reemplazo(Pob,newPobMutada,FitPob,FitMutada);
        itera=itera+1;
        % resto de actualizacion variables y condiciones de parada
        
    end

end
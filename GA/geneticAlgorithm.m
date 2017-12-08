function [Pop,FitPop,itera] = geneticAlgorithm(Pop, FitPop, N, coordinates)
    MAX_itera=2000;
    Pcross=0.7;
    Pmut=0.2;

    itera=1;
    while itera<=MAX_itera

        % RouletteWheel or Tournament
        parents = selection(FitPop,'Tournament'); % Selecciona los padres

        couples = match(parents,Pcross,itera); % Empareja los padres

        if ~isempty(couples)
            % OX or PMX
            newPop = crossover(couples,Pop,'OX'); % Poblacion cruzada
        else
            newPop = Pop;
        end

        newPop = mutation(newPop,Pmut,N); % Población con mutaciones
        newFitPop = evaluatePopulation(newPop,coordinates);

        % generational or elitist
        [Pop,FitPop] = replace(Pop,newPop,FitPop,newFitPop,'generational');
        itera=itera+1;

    end

end

function [Pop,FitPop,itera] = geneticAlgorithm(Pop, FitPop, coordinates, MAX_itera, Pcross, Pmut, cross, sel, rep)

    itera=1;
    while itera<=MAX_itera

        % RouletteWheel or Tournament
        parents = selection(FitPop,sel); % Selecciona los padres

        couples = match(parents,Pcross,itera); % Empareja los padres

        if ~isempty(couples)
            % OX or PMX
            newPop = crossover(couples,Pop,cross); % Población cruzada
        else
            newPop = Pop;
        end

        newPop = mutation(newPop,Pmut,size(coordinates,1)); % Población con mutaciones
        newFitPop = evaluatePopulation(newPop,coordinates);

        % generational or elitist
        [Pop,FitPop] = replace(Pop,newPop,FitPop,newFitPop,rep);
        itera=itera+1;

    end

end
% Genera una población aleatoria

function Pop = generatePopulation(N, M, NPopulation)
    rng default;
    % En todas las pruebas empezará con la misma población inicial
    
    i=0; Pop=[];
    while i~=NPopulation
        Pop = [Pop; randperm(N,M)]; % Generamos un individuo aleatorio
        i=i+1;
    end
end

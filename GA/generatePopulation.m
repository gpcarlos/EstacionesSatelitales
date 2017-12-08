% Genera una población aleatoria

function Pop = generatePopulation(N, M, NPopulation)
    i=0; Pop=[];
    while i~=NPopulation
        Pop = [Pop; randperm(N,M)]; % Generamos un individuo aleatorio
        i=i+1;
    end
end

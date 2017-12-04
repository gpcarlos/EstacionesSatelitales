function pob = GeneratePopulation(N, M, NPoblacion)
    i=0; pob=[];
    while i~=NPoblacion
        pob=[pob;randperm(N,M)];
        i=i+1;
    end
end
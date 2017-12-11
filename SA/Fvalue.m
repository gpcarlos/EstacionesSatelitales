% Devuelve el valor total de las distancias de los representantes actuales

function value = Fvalue(current, coordinates)
    dist = distToRep(current, coordinates); % Calculamos las distancias
    value = sum(min(dist')); % Sumamos solo las distancias de los representantes
end

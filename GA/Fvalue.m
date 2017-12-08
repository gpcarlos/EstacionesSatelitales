% Devuelve el valor total de las distancias de los representantes actuales

function valor = Fvalue(current, coordinates)
    dist = distToRep(current, coordinates); % Calculamos las distancias
    valor = sum(min(dist')); % Sumamos solo las distancias de los representantes
end

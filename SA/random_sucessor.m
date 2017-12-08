% Devuelve un sucesor aleatorio entre todos los posibles

function sucessor = random_sucessor(coordinates,current,pos)

    S = new_assigments(coordinates,current,pos);
    random = randi(size(S,1));
    sucessor = S(random,:);

end

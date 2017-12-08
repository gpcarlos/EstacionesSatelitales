% Devuelve las distancias entre cada uno de todos los satélites no
% representantes y todos los satélites representantes.

% dist será una matriz de tantas filas como satélites no representantes
% y tantas columnas como satélites representantes.

function dist = distToRep(current, coordinates)

    satellites = 1:size(coordinates,1);
    [~,pos] = find(satellites==current(:));
    satellites = setdiff(satellites,satellites(pos));
    % Aislamos los satélites no representantes

    dist=[];
    for i=1:size(satellites,2)
        dist = [dist;
        (euclideanD(coordinates(satellites(i),:),coordinates(current,:)))'];
    end

end

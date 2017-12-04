% Devuelve las distancias entre un de todos los satélistes
% a todas los satélites representantes

function dist=distARep(Repcurrent, space)
    m=1:size(space,1); % Total de satelites
    [~,pos]=find(m==Repcurrent(:));
    m=setdiff(m,m(pos)); % Satelites no representantes
    dist=[];
    for i=1:size(m,2) % Por cada satelite no representante
                      % calculo su dist con cada uno de ellos
        dist=[dist;
             (d_euclidea(space(m(i),:),space(Repcurrent,:)))'];
    end 

end
% Devuelve la distancia euclidea entre v y w

function e = euclideanD(v,w)
    difference = (v-w).^2;
    e = sqrt(sum(difference')');
end

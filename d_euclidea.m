function e=d_euclidea(v,w)
    diferencia=(v-w).^2;
    e=sqrt(sum(diferencia')');
end
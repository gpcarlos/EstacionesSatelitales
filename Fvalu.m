function valor=Fvalu(Repcurrent, space)
    
    dist=distARep(Repcurrent, space);   
    valor=sum(min(dist'));   
    
end


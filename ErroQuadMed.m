function [E] = ErroQuadMed(d, y)  %E - Erro quadrado medio
    E = 0.5*sum((d-y).^2); %sum - soma todas distancias ao quadrado 
    E = mean(E)/size(d,1); %mean - Tira a media dos valores
end

    

function [rbf_elm] = RBFelm(x, d, qNeuro)
     p = 10.^-8; %precisao
     epocaMax = 1; %limita qtdd de epocas 
     testeMax = 10; %elm
     x = Normalizar(x);
    [rbf_elm] = Camada2(x, d, qNeuro, p, epocaMax, testeMax);
end
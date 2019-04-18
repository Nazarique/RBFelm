function [xTreino, xTeste, dTreino, dTeste] = amostraRand(x, d)
    s = size(x,1);
    qtA = round(0.85*s); %qt de Amostras treinamento
    qtT = round(0.15*s); %qt de amostras Testes
    
    o = randperm(s); % muda a ordem das entradas de forma aleatoria
    x = x(o,:); %atribui os valores  com ordem diferente a variaveis iniciais
    d = d(o,:);
    xTreino = x(1:qtA,:);
    xTeste = x(qtA+1:qtT+qtA,:);
    
    dTreino = d(1:qtA,:);
    dTeste = d(qtA+1:qtT+qtA,:);
    
end
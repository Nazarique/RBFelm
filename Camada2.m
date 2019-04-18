function [RBFelm] = Camada2(x, d, qNeuro, p, epocaMax, testeMax) %construtor, e inicializador 
     
     for k=1:testeMax
      clc;
      qNeuro
      k
     [w1, var] = Camada1(x, d, qNeuro);
     w2 = rand(qNeuro+1,size(d,2));
     ExisteErro = 1; %variavel que impede loop infinito 
     Erro = 1;
     ErroAnterior = 0;
     epoca = 0;% qtdd de vezes que a rede treinou 
        while (ExisteErro > 0)
            [xTreino, xTeste, dTreino, dTeste] = amostraRand(x, d); %mistura as amostras
            epoca = epoca + 1; % atribuindo valor a epoca
            ExisteErro = 0; % impedido loop infinito 
            if(abs(Erro - ErroAnterior) > p)% compara se a diferença de erro é maior que a precisao
                ErroAnterior = Erro;
                ExisteErro = ExisteErro+1;
        %foward
                gTreino = saida(xTreino, qNeuro, w1, var);
                gTreino = [-ones(size(gTreino,1),1) gTreino];
                w2 = pinv(gTreino)*dTreino; %retorna o Pseudoinverso de Moore-Penrose.
                y = gTreino*w2; %saida da rede rbf
                Erro = ErroQuadMed(dTreino, y); %calcula erro quadrado medio
                
                if (epoca > epocaMax) %impede que passe da epoca desejada
                    ExisteErro = 0;
                end
            end
        end
        %erros
            ErrosTreino(k) = Erro;
        %acertos Teste
           gTeste = saida(xTeste, qNeuro, w1, var); %foward
           gTeste = [-ones(size(gTeste,1),1) gTeste];
           yTeste = Sinal(gTeste*w2); %transforma a saida em 0 ou 1
           yTeste = Definicao(yTeste); % classica de acordo com a quantidade respostas
           dTeste = Definicao(dTeste);
           acertosT = find(~(dTeste-yTeste)); %encontra todos ou termos diferentes de 0
           acertosTeste(k) = sum(size(acertosT, 1))/size(dTeste,1); %acha a porcentagem de acertos da amostra
          
     end 
           
            RBFelm.qNeuro = qNeuro;
            RBFelm.w1 = w1;
            RBFelm.w2 = w2;
            RBFelm.TaxaAcertosTeste = acertosTeste;
            RBFelm.ErrosTreino = sum(ErrosTreino)/testeMax;
end

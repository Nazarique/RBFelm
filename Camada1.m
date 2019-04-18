function [w, var] = Camada1(x, d, qNeuro) %construtor, e inicializador
          [xTreino] = amostraRand(x, d); %mistura as amostras 
          w = xTreino(1:qNeuro, :); %cria os pesos da primeira camada
          NeuroCentro = zeros(size(xTreino,1),1); %cria o vetor que será usado para armazenar as amostras proximas de cada centro  
          ep = 0;
          antCentro = 0;          
          erro = 1;
       while(erro == 1) %repete o algoritimo até que não aconteça nenhuma mudança 
           grupos = zeros(size(xTreino,1),qNeuro); %cria a matriz que armazena o grupo dos neuronios
            clc
            ep = 1 + ep;
            for j=1:size(xTreino,1)
              for i=1:qNeuro
                distancia = sqrt(sum((xTreino(j,:) - w(i,:)) .^ 2)); %calcula o modulo das distancias
                    if( i==1)
                        aux = distancia;  
                        NeuroCentro(j) = i;
                    end
                     if (distancia < aux) %encontra os neuronios centrais e os re-organiza 
                         aux = distancia;
                         NeuroCentro(j) = i;
                     end
              end
            grupos(j,NeuroCentro(j)) = j; %cria o grupo de amostras de acordo com os neoronios centrais
            end
          for i=1:qNeuro %separa os grupos por neuronio 
           aux = 0;
           aux = find(grupos(:,i) ~= 0); %retira todos zeros
           w(i,:) = sum(xTreino(aux, :),1)/size(aux,1); %altera o valor dos pesos centrais
          end
          if (ep ~= 1)
            if(antCentro == NeuroCentro) %compara se houve alguma alteração de neuronios centrais
                erro = 0;
            else 
                erro = 1;
            end
          else
                erro = 1;
          end
            antCentro = NeuroCentro; %atribui os valores dos neuronios centrais para comparar na proxima epoca
       end
       var = ones(1,qNeuro);
        for i=1:qNeuro %separa os grupos por neuronio 
           aux = 0;
           aux = find(grupos(:,i) ~= 0); %retira todos zeros
           for j=1:size(aux,1)
               v(j,i) = sum((xTreino(aux(j),:) -w(i,:)).^2); %calcula as distancias das amostras de acordo com seus centroides
           end 
           var(i) = sum(v(:,i))/size(aux,1); %calcula a variancia
           if (var(i) == 0)
               var(i) =1;
           end
        end
end
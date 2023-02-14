clear all
m = imread('triangulo.jpg');
%m = imread('circulo.jpg');
%m = imread('quadrado2.jpg');
% m = [0 0 0 0 0 0 0 0 0;
% 0 0 0 0 0 0 0 0 0;
% 0 0 0 0 0 0 0 0 0;    
% 0 1 0 0 0 0 0 0 0;
% 0 1 1 0 0 0 0 0 0;
% 0 1 1 1 0 0 0 0 0;
% 0 1 1 1 1 0 0 0 0;
% 0 1 1 1 1 1 0 0 0;
% 0 1 1 1 1 1 1 0 0;
% 0 0 0 0 0 0 0 0 0];
% Achar o ponto mais acima a esquerda

[ l col ]=size(m); % l número de linhas da imagem

m=m>150; %deixar a imagem binária

i=1; % índice para linha da imagem
j=1; % índice para coluna da imagem

while (m(i,j)<1&&(i<l))
   
     if( j<col)
         j=j+1;
     else
         j=1;
         i=i+1;
     end 
          
    
end

%mostrar a imagem original
figure(1);
imagesc(m);
title('Imagem original');
colormap('gray');
hold on


%guarda o ponto atual da imagem
p(1)=i;
p(2)=j;
%guarda o ponto inicial do objeto
pInit=p;
%guarda o ponto anterior ao atual
antP(1)=i;
antP(2)=j-1;

c(1,1)=i; %pontos da borda 
c(1,2)=j;


nA=antP;

achou=0;% indica a volta ao ponto inicial

i=1; %controla o Ã­ndice do vetor que guarda os pontos

while( achou==0)
    
    antP;
    nA;
    p;
    
          
    if( antP(2)<p(2)) %esquerda
        
        if( (antP(1)-1)>0 &&( antP(2)>0) )
        if(m(antP(1)-1,antP(2))>0)
           antP(1)=antP(1)-1
           antP(2)=antP(2)+1
         
           nA(1)=antP(1);
           nA(2)=antP(2);
           antP(1)=antP(1)+1;
          
        else
          
        if(antP(1)<p(1)) %acima
           %levar para posicao 1
           
           nA(2)=antP(2)+1;
            
           
        elseif( antP(1)==p(1) ) % esta na posicao 2
           nA(2)=antP(2)+1;
           nA(1)=antP(1)-1;
            
           antP(1)=antP(1)-1;
           %antP(2)=antP(2)-1;
           
        end    
        end
        end
         
    else if( antP(2)==p(2) ) %esta na mesma coluna 
           if( antP(1)<p(1) ) % acima 
           % vai para posicao zero 
              nA(1)=antP(1)+1;
              nA(2)=antP(2)+1;
           else % abaixo 
             
              nA(1)=antP(1)-1;
              nA(2)=antP(2)-1;
              
                   
           end    
        else  %esta a direita
            if( antP(1)<p(1) ) % acima 
               nA(1)=antP(1)+1;
                  
            else    
                if( antP(1)==p(1) )
                  
                    % esta na  posicao  0 e vai ara 3
                    nA(1)=antP(1)+1;
                end
                    nA(2)=antP(2)-1;    
            end
        end    
    end
    
     if( (nA(1)>0) &&( nA(2)>0) )
    
    if( m(nA(1),nA(2))>0 )
         i=i+1;
         c(i,1)=nA(1);
         c(i,2)=nA(2);
          
          c(i);
         p=nA;
         
         nA=antP;
         if(i>2)
             
            if ( c(i,1)==c(1,1) && c(i,2)==c(1,2) )
               achou=1;
            end    
         end
         
    else
        antP=nA;
    end
    
     end
end


mB=zeros(l,col);

%Obtem o número de pontos da borda
tamM=length(c(:,1));
%Indice para contar a posição de c2 
k=1;
for i=1:tamM
   

   if(((m(c(i,1)-1,c(i,2)-1)==0)&(m(c(i,1)-1,c(i,2))~=0)&(m(c(i,1),c(i,2)-1)~=0))|((m(c(i,1)-1,c(i,2)+1)==0)&(m(c(i,1)-1,c(i,2))~=0)&(m(c(i,1),c(i,2)+1)~=0))|((m(c(i,1)+1,c(i,2)-1)==0)&(m(c(i,1),c(i,2)-1)~=0)&(m(c(i,1)+1,c(i,2))~=0))|((m(c(i,1)+1,c(i,2)+1)==0)&(m(c(i,1)+1,c(i,2))~=0)&(m(c(i,1),c(i,2)+1)~=0)))
   else
      %define o contorno para obter o código da cadeia de 8 pontos 
      c2(k,1)=c(i,1); 
      c2(k,2)=c(i,2);
      plot(c2(k,2),c2(k,1),'r.');
      k=k+1;
   end
   
end


c(length(c2(:,1))+1,:)=c(1,1);

%Obtem o número de pontos que forma c2 ( contorno 2 )
tamM2=length(c2(:,1));

%Cria uma matriz com os pontos de c2
for i=1:tamM2
   mB(c2(i,1),c2(i,2))=1;    
   
end

%guarda o ponto anterior de c2
ant=[ 0 0 ];
ant=c2(1,:);

k=1;
i=2;



c2

%encontra o código da cadeia do 8 pontos e armazena na matriz cad
while i<tamM2
   
    %calcula a diferença entre o pontos atual e o anterior
    dif=c2(i,:)-ant;
    ant=c2(i,:);
    
    %para cada diferença terá um código 
    if( dif==[0 1] )
       % código 0
       cad(k)=0;  
    else
         if( dif==[1 0] )
            % código 6 
            cad(k)=6;  
         else
             if( dif==[0 -1] )
             % código 4    
             cad(k)=4;  
             else
                  if( dif==[-1 0] )
                   % código 2   
                   cad(k)=2;  
                  else
                      if( dif==[1 1] )
                      % código 7    
                      cad(k)=7;  
                      else
                           if( dif==[-1 1] )
                           % código 1    
                           cad(k)=1;  
                           else
                               if( dif==[1 -1] )
                               % código 5    
                               cad(k)=5;  
                               else
                                  if( dif==[-1 -1] )
                                  % código 3    
                                  cad(k)=3;  
                                 
                               
                                  end
                               end
                           end
                      end
                  end
             end
         end    
    end
    i=i+1;
    k=k+1;
end

%guarda o número de linhas e colunas de cad
[ tl tc ]=size(cad);

hold off



figure(3);
imagesc(m);
title('ImB');
colormap('gray');


 mB2=zeros(l,col);

Patual=pInit;


figure(5);
imagesc(m);
title('Contorno original');
colormap('gray');
hold on

mB2(pInit(1),pInit(2))=1; 
for i=1:tc 
   switch ( cad(i) )
       case 0
            Patual(2)=Patual(2)+1;
       case 1
            Patual(2)=Patual(2)+1;
            Patual(1)=Patual(1)-1;
       case 2
            Patual(1)=Patual(1)-1;
       case 3
             Patual(2)=Patual(2)-1;
            Patual(1)=Patual(1)-1;
       case 4
            Patual(2)=Patual(2)-1;
       case 5
            Patual(2)=Patual(2)-1;
            Patual(1)=Patual(1)+1;
       case 6
            Patual(1)=Patual(1)+1;
       case 7    
            Patual(2)=Patual(2)+1;
            Patual(1)=Patual(1)+1;
   end    
    Patual
    plot(Patual(2),Patual(1),'g.'); 
    mB2(Patual(1),Patual(2))=1; 
end


hold off





figure(2);
imagesc(mB);
title('Contorno original');
colormap('gray');


figure(4);
imagesc(mB2);
title('Contorno recuperado');
colormap('gray');




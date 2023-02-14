m = imread('quadrado2.jpg');

% Achar o ponto mais acima a esquerda

[ l col ]=size(m);

m=m>150;
achou=0; 

i=1;
j=1;
achou=0;
while (m(i,j)<1&&(i<=l))
   
     if( j<col)
         j=j+1;
     else
         j=1;
         i=i+1;
     end 
          
    
end

figure(1);
imagesc(m);
title('Imagem original');
colormap('gray');
hold on



p(1)=i;
p(2)=j;

antP(1)=i;
antP(2)=j-1;

c(1,1)=i; %pontos da borda 
c(1,2)=j;

nA=antP;

achou=0;% indica a volta ao ponto inicial

i=1; %controla o índice do vetor que guarda os pontos

while( achou==0)
    if( antP(2)<p(2)) %esquerda
        if(antP(1)<p(2)) %acima
           %levar para posicao 1
           nA(2)=antP(2)+1;
        elseif( antP(1)==p(1) ) % esta na posicao 2
           nA(2)=antP(2)+1;
           
        end    
        nA(1)=antP(1)-1;
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
    if( m(nA(1),nA(2))>0 )
         i=i+1;
         c(i,1)=nA(1);
         c(i,2)=nA(2);
         p=nA;
         plot(c(i,2),c(i,1),'r.');
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
hold off

mB=zeros(l,col);

tamM=length(c(:,1));

for i=1:tamM
   mB(c(i,1),c(i,2))=1;    
   %plot(c(i,2),c(i,1),'b.');
end





%plot(j,i,'r.')
%plot(j-1,i,'b.')


figure(2);
imagesc(mB);
title('ImB');
colormap('gray');



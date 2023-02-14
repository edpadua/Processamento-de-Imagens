clear all

%leitura da imagem
m = imread('alicate.jpg');

%m;
%exibir a imagem original
figure(1);
imagesc(m);
title('Imagem original');
colormap('gray');
%m=double(m);

[ l c ]=size(m);

for i=1:l
  for j=1:c
      if(m(i,j)>=150)
          m(i,j)=255;
      else
          m(i,j)=0;
      end
  end
end



%defini��o do elemento estruturante
e=[ 1 0; 1 1];

e=[ 1 0; 1 1];
 ee=[-1 -1; -1 0; -1 1; -1 0; 0 1; 1 -1; 1 0; 1 1];  

xo1=1; %posi��o da origem no elemento estruturante 
yo1=0;
%Mdil=dilat(m,e,1,0);
%Mdil=dilatacao(m,ee);
Mdil=Abertura(m,ee);
%Merr=errod(m,e,1,0);
%Merr=erosao(m,ee);
Merr=Fechamento(m,ee);


%exibir a imagem =com dilata��o
figure(2);
imagesc(Mdil);
title('Imagem resultante da dilata��o');
colormap('gray');

%exibir a imagem com erosao
figure(3);
imagesc(Merr);
title('Imagem resultante da erosao');
colormap('gray');
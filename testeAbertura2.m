clear all

%leitura da imagem
m = imread('alicate.jpg');
%m;

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
e=[1 1 1; 1 1 1; 1 1 1];
m=255-m;

%exibir a imagem original
figure(1);
imagesc(m);
title('Imagem original');
colormap('gray');

xo1=2; %posi��o da origem no elemento estruturante 
yo1=2;
%Mdil=Abertura(m,e,1,0);
%Merr=Fechamento(m,e,1,0);
Mdil=dilat(m,e,xo1,yo1);
Merr=errod(m,e,xo1,yo1);

GI=m-Merr;
GE=Mdil-m


%exibir a imagem =com dilata��o
figure(2);
imagesc(GI);
title('Imagem resultante da dilata��o');
colormap('gray');

%exibir a imagem com erosao
figure(3);
imagesc(GE);
title('Imagem resultante da erosao');
colormap('gray');
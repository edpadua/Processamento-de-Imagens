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




%defini��o do elemento estruturante
e=[1 0; 1 1];

xo1=1; %posi��o da origem no elemento estruturante 
yo1=0;
Mdil=Abertura(m,e,1,0);
Merr=Fechamento(m,e,1,0);



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
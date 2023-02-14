clear all

%leitura da imagem
m = imread('casa.jpg');

%m;
%exibir a imagem original
figure(1);
imagesc(m);
title('Imagem original');
colormap('gray');

%m=[20 23 26 28 32 25 25 17; 17 19 19 35 28 34 33 28; 34 36 27 33 37 44 40 41; 32 27 18 16 21 26 28 32;34 27 25 23 24 35 37 29];
%ee=[1 2 1;2 3 2;1 2 1];
ee=[1 2 1;2 0 2;1 2 1];


Dilat=dilatacao_cinza(m,ee,2,2);
Erod=erosao_cinza(m,ee,2,2);
Grad=gradiente_morf_cinza(m,ee,2,2);

figure(2);
imagesc(Dilat);
title('Imagem dilatada');
colormap('gray');

figure(3);
imagesc(Erod);
title('Imagem erodida');
colormap('gray');

figure(4);
imagesc(Grad);
title('Imagem erodida');
colormap('gray');
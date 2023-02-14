clear all
im1 = imread('celulas.jpg');


figure(1);
imagesc(im1);
colormap('gray');


tamf=5;

[l c ]=size(im1);
centrol=round(l/2);
centroc=round(c/2);






masc=zeros(l,c);



masc_inic=ones(tamf,tamf)/(tamf*tamf);

% iniciol=centrol-round(tamf/2);
% fiml=centrol+(tamf-round(tamf/2))-1; 
% 
% inicioc=centroc-round(tamf/2);
% fimc=centroc+(tamf-round(tamf/2))-1; 
% 
% masc(iniciol:fiml,inicioc:fimc)=masc_inic*255;
masc(1:tamf,1:tamf) = masc_inic;

figure(2);
imagesc(masc);
colormap('gray');

Fim1=fft2(im1);
Fmasc=fft2(masc);

Fres=Fim1.*Fmasc;
Fres=Fres.*Fmasc;
Fres=Fres.*Fmasc;
Fres=Fres.*Fmasc;
Fres=Fim1.*Fmasc;
Fres=Fres.*Fmasc;
Fres=Fres.*Fmasc;
Fres=Fres.*Fmasc;
% 

imfiltrada=real(ifft2(Fres));

imfinal=double(im1)-imfiltrada;


figure(3);
imagesc(imfiltrada);
colormap('gray');


 figure(4);
 imagesc(imfinal);
 colormap('gray');




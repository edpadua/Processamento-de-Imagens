clear all
im1 = imread('palhaco.jpg');


deslocamento1=15
r1=10;

deslocamento2=25
r2=15;

[l c ]=size(im1);
filtropb=255*ones(l,c);

centroi=round(l/2);
centroj=round(c/2);

for i=-r1:r1
   for j=-r1:r1
       if(i*i + j*j<r1*r1)
          filtropb(i+centroi-deslocamento1,j+centroj-deslocamento1)=0;
          filtropb(i+centroi+deslocamento1,j+centroj+deslocamento1)=0;
       end    
   end
end    

for i=-r2:r2
   for j=-r2:r2
       if(i*i + j*j<r2*r2)
          filtropb(i+centroi+deslocamento2,j+centroj-deslocamento2)=0;
          filtropb(i+centroi-deslocamento2,j+centroj+deslocamento2)=0;
       end    
   end
end  





figure(1);
imagesc(im1);
colormap('gray');

F=fft2(im1);




filtragempb=F.*fftshift(filtropb);
filtragempb_log=log(1+abs(filtragempb));

figure(2);
imagesc(fftshift(filtragempb_log));
colormap('gray');



imfiltrada=abs(ifft2(filtragempb));


figure(4);
imagesc(imfiltrada);
colormap('gray');
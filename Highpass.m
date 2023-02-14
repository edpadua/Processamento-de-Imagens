clear all
im1 = imread('digital.jpg');

raio=20;

[l c ]=size(im1);
filtropb=255*ones(l,c);

centroi=round(l/2);
centroj=round(c/2);

for i=-raio:raio
   for j=-raio:raio
       if(i*i + j*j<raio*raio)
          filtropb(i+centroi,j+centroj)=0;
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
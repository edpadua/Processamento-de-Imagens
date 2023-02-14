clear all
im1 = imread('digital.jpg');

figure(1);
imagesc(im1);
colormap('gray');


im2=abs(fft2(im1));
im2=fftshift(im2);

im3=log(im2);

im4=abs(ifft2(fft2(im1)));



figure(2);
imagesc(im2);
colormap('gray');


figure(3);
imagesc(im3);
colormap('gray');

figure(4);
imagesc(im4);
colormap('gray');

clear all
im = imread('casa.jpg');
figure(1);
h=zeros(256,1);
imagesc(im);
colormap('gray');
[l,c]=size(im);

for i=0:255
    [num,aux]=size(find(im==i));
    h(i+1)=num;
end

h=h/(l*c);
figure(2);
bar(h);




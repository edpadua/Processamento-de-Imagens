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

P(1)=h(1);
for i=2:256
    
    P(i)=h(i)+P(i-1);
end

B=double(im(:));
tam=l*c;
i=1:tam;
imr(i)=round(255*P(B(i)+1));
imr=reshape(imr,[l,c]);


for i=0:255
    [num,aux]=size(find(imr==i));
    h(i+1)=num;
end

h=h/(l*c);
figure(3);
bar(h);

figure(4);
imagesc(imr);
colormap('gray');
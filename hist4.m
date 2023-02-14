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

P(find(P==1))=0.999999;

alpha=3;
B=double(im(:));
tam=l*c;
i=1:tam;

F=-log(1-P)/alpha;

F(find(F>1))=1;
F
imr(i)=round(255*F(B(i)+1));
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
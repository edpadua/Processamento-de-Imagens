im=[0 3 3 4 4 4;1 1 1 4 4 5;1 1 1 4 5 5;1 1 1 7 6 6;2 2 7 7 6 6;8 2 7 7 9 9];


h=zeros(19,1);

[l,c]=size(im);

imr=zeros(l,c);


for i=0:18
    [num,aux]=size(find(im==i));
    h(i+1)=num;
end


h=h/(l*c);
figure(2);
bar(h);

P(1)=h(1);
for i=2:19
    
    P(i)=h(i)+P(i-1);
end

P

B=double(im(:));
B
tam=l*c;
tam
i=1:tam;
imr(i)=round(18*P(B(i)+1));
[L C]=size(imr)
imr=reshape(imr,[l,c]);

imr

for i=0:18
    [num,aux]=size(find(imr==i));
    h(i+1)=num;
end


figure(3);
bar(h);


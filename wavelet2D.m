% ================== Transformada Wavelet de Haar
clear;
img = imread('palhaco.jpg');
img = double(img);
nf=1;
figure(nf);
imagesc(img);
colormap('gray');
title('Imagem Original')
[lin,col] = size(img);
% The level-1 Haar transform
for i=1:lin
for m=1:col/2;
a1(m)=(img(i,2*m-1)+img(i,2*m))/sqrt(2);
d1(m)=(img(i,2*m-1)-img(i,2*m))/sqrt(2);
end;
Resto(i,:) = d1;
L1(i,:)=[a1 d1];
end
for i=1:col
for m=1:lin/2;
a1(m)=(L1(2*m-1,i)+L1(2*m,i))/sqrt(2);
d1(m)=(L1(2*m-1,i)-L1(2*m,i))/sqrt(2);
end
A1(:,i) = a1;
D1(:,i) = d1;
end
H1=[A1; D1];

% The level 2 Haar transform
for i=1:lin
for m=1:col/4;
a2(m)=(H1(i,2*m-1)+H1(i,2*m))/sqrt(2);
d2(m)=(H1(i,2*m-1)-H1(i,2*m))/sqrt(2);
end;
Resto2(i,:) = d2;
L2(i,:)=[a2 d2 d1];
end
for i=1:col
for m=1:lin/4;
a2(m)=(L2(2*m-1,i)+L2(2*m,i))/sqrt(2);
d2(m)=(L2(2*m-1,i)-L2(2*m,i))/sqrt(2);
end
A2(:,i) = a2;
D2(:,i) = d2;
end
H2=[A2; D2; D1];


% The level 3 Haar transform
for i=1:lin
for m=1:col/8;
a3(m)=(H2(i,2*m-1)+H2(i,2*m))/sqrt(2);
d3(m)=(H2(i,2*m-1)-H2(i,2*m))/sqrt(2);
end;
Resto3(i,:) = d3;
L3(i,:)=[a3 d3 d2 d1];
end
for i=1:col
for m=1:lin/8;
a3(m)=(L3(2*m-1,i)+L3(2*m,i))/sqrt(2);
d3(m)=(L3(2*m-1,i)-L3(2*m,i))/sqrt(2);
end
A3(:,i) = a3;
D3(:,i) = d3;
end
H3=[A3; D3; D2; D1];


nf = nf + 1;
figure(nf);
imagesc(H1);
colormap('gray');
title('Haar nivel 1')

nf = nf + 1;
figure(nf);
imagesc(H2);
colormap('gray');
title('Haar nivel 2')

nf = nf + 1;
figure(nf);
imagesc(H3);
colormap('gray');
title('Haar nivel 3')


%%%%%%%%%%%%%%%%%%%%%%%
%I N V E R S A
%%%%%%%%%%%%%%%%%%%%%
%recupera imagem inicial



for i=1:col
for m=1:2:lin/4;
b2(m)=(A3(round(m/2),i)+D3(round(m/2),i))/sqrt(2);
b2(m+1)=(A3(round(m/2),i)-D3(round(m/2),i))/sqrt(2);
end;
B2(:,i) = b2;
end
T2 = [B2; D2; D1];

for i=1:lin
for m=1:2:col/4;
b2(m)=(T2(i,round(m/2))+Resto3(i,round(m/2)))/sqrt(2);
b2(m+1)=(T2(i,round(m/2))-Resto3(i,round(m/2)))/sqrt(2);
end;
B2(i,:) = b2;
end

C2 = [B2 Resto2 Resto];

nf = nf + 1;
figure(nf);
imagesc(C2);
colormap('gray');
title('Inversa Haar nivel 2')

for i=1:col
for m=1:2:lin/2;
b1(m)=(C2(round(m/2),i)+D2(round(m/2),i))/sqrt(2);
b1(m+1)=(C2(round(m/2),i)-D2(round(m/2),i))/sqrt(2);
end;
B1(:,i) = b1;
end
T1 = [B1; D1];

for i=1:lin
for m=1:2:col/2;
b1(m)=(T1(i,round(m/2))+Resto2(i,round(m/2)))/sqrt(2);
b1(m+1)=(T1(i,round(m/2))-Resto2(i,round(m/2)))/sqrt(2);
end;
B1(i,:) = b1;
end

C1 = [B1 Resto];

nf = nf + 1;
figure(nf);
imagesc(C1);
colormap('gray');
title('Inversa Haar nivel 1')



for i=1:col
for m=1:2:lin;
b0(m)=(A1(round(m/2),i)+D1(round(m/2),i))/sqrt(2);
b0(m+1)=(A1(round(m/2),i)-D1(round(m/2),i))/sqrt(2);
end;
T(:,i) = b0;
end
for i=1:lin
for m=1:2:col;
b0(m)=(T(i,round(m/2))+Resto(i,round(m/2)))/sqrt(2);
b0(m+1)=(T(i,round(m/2))-Resto(i,round(m/2)))/sqrt(2);
end;
C(i,:) = b0;
end
nf = nf + 1;
figure(nf);
imagesc(C);
colormap('gray');
title('Inversa Haar original')

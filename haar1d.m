% ================ Transformada Wavelet de Haar
clear;
N=1024;
% Number of points
for n=1:N
m=(n-1)/N;
g(n)=20*m^2*(1-m)^4*cos(12*pi*m);
end
for m=1:N/2
a1(m)=(g(2*m-1)+g(2*m))/sqrt(2); % Use direct formulas for t and f
d1(m)=(g(2*m-1)-g(2*m))/sqrt(2);
end
H1=[a1 d1];
% The level-1 Haar transform
for m=1:N/4
a2(m)=(a1(2*m-1)+a1(2*m))/sqrt(2);
d2(m)=(a1(2*m-1)-a1(2*m))/sqrt(2);
end
H2=[a2 d2 d1];
for m=1:N/8
a3(m)=(a2(2*m-1)+a2(2*m))/sqrt(2);
d3(m)=(a2(2*m-1)-a2(2*m))/sqrt(2);
end
H3=[a3 d3 d2 d1];
for m=1:N/16
a4(m)=(a3(2*m-1)+a3(2*m))/sqrt(2);
d4(m)=(a3(2*m-1)-a3(2*m))/sqrt(2);
end
H4=[a4 d4 d3 d2 d1];
% ================ Transformada INVERSA Wavelet de Haar
for m=1:2:N/8
b3(m)=(a4(round(m/2))+d4(round(m/2)))/sqrt(2);
b3(m+1)=(a4(round(m/2))-d4(round(m/2)))/sqrt(2);
end;
T3 = [b3 d3 d2 d1];
for m=1:2:N/4
b2(m)=(b3(round(m/2))+d3(round(m/2)))/sqrt(2);
b2(m+1)=(b3(round(m/2))-d3(round(m/2)))/sqrt(2);
end;
T2 = [b2 d2 d1];
for m=1:2:N/2
b1(m)=(b2(round(m/2))+d2(round(m/2)))/sqrt(2);
b1(m+1)=(b2(round(m/2))-d2(round(m/2)))/sqrt(2);
end;
T1 = [b1 d1];
for m=1:2:N
b0(m)=(b1(round(m/2))+d1(round(m/2)))/sqrt(2);
b0(m+1)=(b1(round(m/2))-d1(round(m/2)))/sqrt(2);
end;
% ==================== Constroi os gráficos:
%

figure
subplot(3,1,1),plot(g,'r')
subplot(3,1,2),plot(H1,'b')
subplot(3,1,3),plot(b0,'b')
figure
hold on
plot(g,'r')
plot(b0,'b')
hold off
% Transf. Wavelet de Ha

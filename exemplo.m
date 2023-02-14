alpha=50;
t=0:0.01:1;
y=sin(alpha*t);
plot(t,y);
xlabel('tempo(s)');
ylabel('y(t)=sin(\alpha t)');
grid on;
clear all
im1 = imread('frutas.jpg');
figure(1);

imagesc(im1);
colormap('gray');
[l,c]=size(im1);


centrox=round(l/2);
centroy=round(c/2);

img_Rot=zeros(l,c);
img_Trans=zeros(l,c);

u2=0;
v2=0;
u=0;
v=0;
theta=60;
alpha=(theta*pi)/180;


  
im1 = imread('frutas.jpg');
figure(1);

 
     
    
    for x=1:l 
      for y=1:c
            xaux=x-centrox;
            yaux=y-centroy;
           % u2=round(xaux*cos(alpha)-yaux*sin(alpha)+centrox);
          %  v2=round(xaux*sin(alpha)+yaux*cos(alpha)+centroy);
             u2=round(xaux*cos(alpha)-yaux*sin(-alpha)+centrox);
            v2=round(xaux*sin(-alpha)+yaux*cos(alpha)+centroy);
            %trocar sinal do seno
            if((u2>0) &(v2>0)& (u2<l)&(v2<c))
               %img_Rot(x,y)=im1(u2,v2);
               img_Rot(u,v)=im1(x,y);
                
            end
            
        
      end
    end

figure (2);
imagesc(img_Rot);
colormap('gray');
